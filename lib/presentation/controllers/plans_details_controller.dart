import 'dart:convert';

import 'package:aurora_connect_one/domain/confirm_order/confirm_order_response.dart';
import 'package:aurora_connect_one/domain/signup/SignUpResponse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../application/services/secure_storage.dart';
import '../../domain/confirm_order/ConfirmOrderRequest.dart';
import '../../domain/create_order/create_order_request.dart';
import '../../domain/create_order/create_order_response.dart';
import '../../domain/signup/SignUpRequest.dart';
import '../provider/plans_provider.dart';
import '../screens/main_screen.dart';
import '../widgets/constants.dart';

class PlanDetailsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  final SecureStorage secureStorage = SecureStorage();
  var createOrderResponse = CreateOrderResponse().obs;
  var signUpResponse = SignUpResponse().obs;
  var confirmOrderResponse = ConfirmOrderResponse().obs;

  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  createOrderRequest(CreateOrderRequest request) async {
    print('calling for createOrderRequest ');
    loading(true);
    final map = {
      "quantity": request.quantity,
      "packageId": request.packageId,
      "userId": "",
      "planDetail": request.planDetail
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/Order/CreateOrder';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      createOrderResponse.value = getCreateOrderResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
      print("Preparing Request for sign-up");
      SignUpRequest signUpRequest = SignUpRequest();

      signUpRequest.username = "Ahmed Rehman";
      signUpRequest.email = "ahmedrehman123@gmail.com";
      signUpRequest.phone = "+923127113699";
      secureStorage.writeSecureData(
          "requestUserName", signUpRequest.username.toString());
      secureStorage.writeSecureData(
          "requestUserEmail", signUpRequest.email.toString());
      secureStorage.writeSecureData(
          "requestUserPhone", signUpRequest.phone.toString());

      /// Assigning Storage data to variable to use checks
      await secureStorage
          .readSecureData('requestUserName')
          .then((value) => {flutterSecureLoginUserName = value});
      await secureStorage
          .readSecureData('requestUserEmail')
          .then((value) => {flutterSecureLoginUserName = value});
      await secureStorage
          .readSecureData('requestUserPhone')
          .then((value) => {flutterSecureLoginUserName = value});
      print("Storage Data");
      print(flutterSecureLoginUserName! + flutterSecureClientEmail! + flutterSecureClientPhone!);
     if(flutterSecureLoginUserName != null ){
       print("Storage Data for api");
       signUpRequest.username = flutterSecureLoginUserName;
       signUpRequest.email = flutterSecureClientEmail;
       signUpRequest.phone = flutterSecureClientPhone;
       signUpUserRequest(
           signUpRequest, createOrderResponse.value.data?.orderId ?? "");
     }else{
       print("hard code data for api");
      signUpUserRequest(
          signUpRequest, createOrderResponse.value.data?.orderId ?? "");}
    } else {
      printError(info: "Response Error: ${response_1.body}");
    }

    loading(false);
  }

  signUpUserRequest(SignUpRequest request, String orderId) async {
    print('calling for signUpUserRequest ');
    loading(true);
    final map = {
      "email": request.email,
      "username": request.username,
      "phone": request.phone
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/UserSignup';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      signUpResponse.value = getSignUpResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
      print("Preparing Request for order-confirmation");

      ConfirmOrderRequest confirmOrderRequest = ConfirmOrderRequest();
      confirmOrderRequest.userId = signUpResponse.value.data?.userId;
      confirmOrderRequest.orderId = "${orderId}";

      orderConfirmationRequest(
          confirmOrderRequest, signUpResponse.value.data?.token ?? "");
    } else {
      printError(info: "Response Error: ${response_1.body}");
    }

    loading(false);
  }

  orderConfirmationRequest(ConfirmOrderRequest request, String token) async {
    print('calling for orderConfirmationRequest ');
    final map = {"userId": request.userId, "orderId": request.orderId};
    var url =
        "https://auroraconnect.absoluit.com/api/api/Order/ConfirmOrder?userId=${request.userId}&orderId=${request.orderId}";
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    print("Request Bearer-token : ${token}");
    if (response_1.statusCode == 200) {
      print("success msg  ${response_1.statusCode}");
      confirmOrderResponse.value =
          confirmOrderResponseFromJson(response_1.body);
      String responseString = response_1.body;
      print("Response Data1: $responseString");
      Get.to(const MainScreen());
    } else {
      printError(info: "Response Error: ${response_1.statusCode}");
    }
  }
}
