import 'dart:convert';

import 'package:aurora_connect_one/domain/confirm_order/confirm_order_response.dart';
import 'package:aurora_connect_one/domain/signup/SignUpResponse.dart';
import 'package:aurora_connect_one/presentation/widgets/progressIndicator_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/confirm_order/ConfirmOrderRequest.dart';
import '../../domain/create_order/create_order_request.dart';
import '../../domain/create_order/create_order_response.dart';
import '../../domain/signup/SignUpRequest.dart';
import '../screens/main_screen.dart';
import '../widgets/constants.dart';

class PlanDetailsController extends GetxController
    with CustomProgressIndicator {
  late SharedPreferences prefs;

  @override
  void onReady() {
    super.onReady();
    initSharedPreference();
  }

  Future<void> initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

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
      print("Request: ${jsonEncode(map)}");
      const url =
          'https://auroraconnect.absoluit.com/api/api/Order/CreateOrder';
      var response_1 = await http.post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: jsonEncode(map));
      print(response_1.body);
      if (response_1.statusCode == 200) {
        createOrderResponse.value =
            createOrderResponseFromJson(response_1.body);
        String responseString = response_1.body;
        print("Response Data: $responseString");
        print("=====================================================");
        print("Preparing Request for sign-up");
        SignUpRequest signUpRequest = SignUpRequest();

        signUpRequest.username = "Ahmed Rehman";
        signUpRequest.email = "ahmedrehman123@gmail.com";
        signUpRequest.phone = "+923127113699";
        if (prefs != null) {
          prefs.setString(USER_NAME, signUpRequest.username.toString());
          prefs.setString(USER_EMAIL, signUpRequest.email.toString());
          prefs.setString(USER_PHONE, signUpRequest.phone.toString());
          prefs.setString(ORDER_ID, createOrderResponse.value.data?.orderId ?? "");

          String? userNameString = prefs.getString(USER_NAME);
          String? userEmailString = prefs.getString(USER_EMAIL);
          String? userPhoneString = prefs.getString(USER_PHONE.toString());

          String? userIdString = prefs.getString(USER_ID);
          String? userOrderIdString = prefs.getString(ORDER_ID);
          String? userTokenString = prefs.getString(USER_TOKEN);

          if (userIdString == null) {
            print("User is not available in local storage so we are going to signup first");
            signUpUserRequest(
                signUpRequest, createOrderResponse.value.data?.orderId ?? "");
          } else {
            print("User information is available in local storage so we are going to confirm order directly");
            ConfirmOrderRequest confirmOrderRequest = ConfirmOrderRequest();
            confirmOrderRequest.userId = userIdString;
            confirmOrderRequest.orderId = userOrderIdString;

            await orderConfirmationRequest(confirmOrderRequest, userTokenString ?? "");
          }
        }
      }
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

        if (prefs != null) {
          prefs.setString(USER_ID, signUpResponse.value.data?.userId ?? "");
          prefs.setString(USER_TOKEN, signUpResponse.value.data?.token ?? "");
        }

        await orderConfirmationRequest(confirmOrderRequest, signUpResponse.value.data?.token ?? "");
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
      print("Request: ${jsonEncode(map)}");
      print("Request Bearer-token : ${token}");
      var url = "https://auroraconnect.absoluit.com/api/api/Order/ConfirmOrder?userId=${request.userId}&orderId=${request.orderId}";
      var response_1 = await http.post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(map));
      if (response_1.statusCode == 200) {
        confirmOrderResponse.value = confirmOrderResponseFromJson(response_1.body);
        String responseString = response_1.body;
        print("Response Data1: $responseString");
        stopCircularProgressIndicator(context);
        print("Your order is confirmed from server side");
        Get.to(() => const MainScreen());
      } else {
        printError(info: "Response Error: ${response_1.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
