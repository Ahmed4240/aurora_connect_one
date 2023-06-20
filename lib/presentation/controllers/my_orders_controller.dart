import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/my_orders/my_orders_request.dart';
import '../../domain/my_orders/my_orders_response.dart';

class MyOrdersController extends GetxController {
  var myOrdersResponse = MyOrdersResponse().obs;
  var loading = false.obs;

  // getMyOrders(MyOrdersRequest request) async {
  getMyOrders() async {
    print('calling for createOrderRequest ');
    loading(true);
    final map = {
      "userId": '6df747ff-526c-4a79-a00b-3d09941e47cb',
    };
    const url =
        'https://auroraconnect.absoluit.com/api/api/Order/GetAllOrdersByCustomer';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIxIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibW9oc2lubXVzaHRhcTQxNDFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkOWVjOTRmYi04YmE1LTRkYjQtYjkyZi1lNzg5ODA4ZDNhY2MiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyYXRpb24iOiJKdW4gV2VkIDIxIDIwMjMgMDk6MzI6NDggQU0iLCJleHAiOjE2ODcyNDYzNjgsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MjUwIn0.2KiM2g2x46IaCHiBh8smYKYe6CRe71FBov5XGqyYGRc'
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
