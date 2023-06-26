import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/my_orders/my_orders_response.dart';

class MyOrdersController extends GetxController {
  var myOrdersResponse = MyOrdersResponse().obs;
  var loading = false.obs;

  getMyOrders(String clientUserId, String clientToken) async {
    print('calling for getMyOrders');

    loading(true);
    try {
      final map = {
        "userId": clientUserId.toString(),
      };
      var url = 'https://auroraconnect.absoluit.com/api/api/Order/GetAllOrdersByCustomer?userId=${clientUserId.toString()}';
      var response_1 = await http.post(Uri.parse(url),
          headers: {
            "Accept": "text/plain",
            "content-type": "application/json",
            'Authorization': 'Bearer $clientToken'
          });
      if (response_1.statusCode == 200) {
        String responseString = response_1.body;
        print("Response Data: $responseString");
        myOrdersResponse.value = getMyOrdersFromJson(response_1.body);
        print("=====================================================");
      } else {
        printError(info: "Response Error: ${response_1.body}");
      }
    } catch (e) {
      print(e);
    }

    loading(false);
  }
}
