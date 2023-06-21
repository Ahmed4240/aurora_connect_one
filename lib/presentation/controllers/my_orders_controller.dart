import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/my_orders/my_orders_request.dart';
import '../../domain/my_orders/my_orders_response.dart';

class MyOrdersController extends GetxController {
  var myOrdersResponse = MyOrdersResponse().obs;
  var loading = false.obs;

  // getMyOrders(MyOrdersRequest request) async {
  getMyOrders(String clientUserId, String clientToken) async {
    print('calling for createOrderRequest ');
    loading(true);
    final map = {
      "userId": clientUserId,
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/Order/GetAllOrdersByCustomer';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          'Authorization': 'Bearer $clientToken'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      myOrdersResponse.value = getMyOrdersFromJson(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
    } else {
      printError(info: "Response Error: ${response_1.body}");
    }

    loading(false);
  }
}
