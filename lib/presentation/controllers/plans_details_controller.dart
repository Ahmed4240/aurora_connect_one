import 'dart:convert';

import 'package:aurora_connect_one/domain/confirm_order/confirm_order_response.dart';
import 'package:aurora_connect_one/domain/signup/SignUpResponse.dart';
import 'package:aurora_connect_one/presentation/widgets/progressIndicator_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../application/services/secure_storage.dart';
import '../../domain/confirm_order/ConfirmOrderRequest.dart';
import '../../domain/create_order/create_order_request.dart';
import '../../domain/create_order/create_order_response.dart';
import '../../domain/signup/SignUpRequest.dart';
import '../provider/plans_provider.dart';
import '../screens/main_screen.dart';
import '../widgets/constants.dart';

class PlanDetailsController extends GetxController
    with CustomProgressIndicator {
  @override
  void onReady() {
    super.onReady();
  }

  final SecureStorage secureStorage = SecureStorage();
  var createOrderResponse = CreateOrderResponse().obs;
  var signUpResponse = SignUpResponse().obs;
  var confirmOrderResponse = ConfirmOrderResponse().obs;

  var loading = false.obs;

  createOrderRequest(CreateOrderRequest request) async {
    try {
      print('calling for createOrderRequest ');
      // loading(true);
      final map = {
        "quantity": request.quantity,
        "packageId": request.packageId,
        "userId": "",
        "planDetail": request.planDetail
      };
      print("${request.quantity} ${request.packageId} + ${request.planDetail}");
      const url =
          'https://auroraconnect.absoluit.com/api/api/Order/CreateOrder';
      var response_1 = await http.post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: jsonEncode(map));
      print(response_1.body);
      print("Request: ${jsonEncode(map)}");
      if (response_1.statusCode == 200) {
        print("Create Apiu Response");

        print("printing after 200");
        createOrderResponse.value =
            createOrderResponseFromJson(response_1.body);
        print("printing after resfonse ");
        print("printing after resfonse ");
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
        // print("testing1" + signUpRequest.phone.toString());



        print("Storage Data");
        // print(flutterSecureLoginUserName.toString() +
        //     flutterSecureClientEmail.toString() +
        //     flutterSecureClientPhone.toString());

        // if (flutterSecureLoginUserName == null) {
        //   /// Assigning Storage data to variable to use checks
        //   print("Stored Data for api$flutterSecureLoginUserName");
        //   print(flutterSecureLoginUserName.toString());
        //   signUpRequest.username = flutterSecureLoginUserName.toString();
        //   signUpRequest.email = flutterSecureClientEmail.toString();
        //   signUpRequest.phone = flutterSecureClientPhone.toString();
        //
        //   ///  if Data Available in Secure Storage then Directly move to Order Confirmation
        //   // await orderConfirmationRequest(
        //   //     confirmOrderRequest, signUpResponse.value.data?.token ?? "");
        // } else {
        //   await secureStorage
        //       .readSecureData('requestUserName')
        //       .then((value) => {flutterSecureLoginUserName = value});
        //   await secureStorage
        //       .readSecureData('requestUserEmail')
        //       .then((value) => {flutterSecureClientEmail = value});
        //   await secureStorage
        //       .readSecureData('requestUserPhone')
        //       .then((value) => {flutterSecureClientPhone = value});
        //
        //
        //   print("first time calling");
          /// hitting api for the first time api Call
           signUpUserRequest(
              signUpRequest, createOrderResponse.value.data?.orderId ?? "");
        }
      // } else {
      //   printError(info: "Response Error: ${response_1.body}");
      // }
    } catch (e) {
      rethrow;
    }
  }

  signUpUserRequest(SignUpRequest request, String orderId) async {
    try {
      print('calling for signUpUserRequest ');
      // loading(true);
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

        // user id and token stored into db

        secureStorage.writeSecureData("requestUserId", signUpResponse.value.data?.userId ?? "");
        secureStorage.writeSecureData("requestUserToken", signUpResponse.value.data?.token ?? "");

        await orderConfirmationRequest(
            confirmOrderRequest, signUpResponse.value.data?.token ?? "");
      } else {
        printError(info: "Response Error: ${response_1.body}");
      }
    } catch (e) {
      rethrow;
    }

    // loading(false);
  }

  orderConfirmationRequest(ConfirmOrderRequest request, String token,
      {BuildContext? context}) async {
    try {
      print('calling for orderConfirmationRequest ');
      final map = {"userId": request.userId, "orderId": request.orderId};
      var url = "https://auroraconnect.absoluit.com/api/api/Order/ConfirmOrder?userId=${request.userId}&orderId=${request.orderId}";
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
        stopCircularProgressIndicator(context);
        Get.to(const MainScreen());
      } else {
        printError(info: "Response Error: ${response_1.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
