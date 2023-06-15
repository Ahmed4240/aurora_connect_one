
import 'dart:convert';

import 'package:aurora_connect_one/domain/create_order/create_order_request.dart';
import 'package:get/get_connect/connect.dart';

class PlansProvider extends GetConnect {
  Future<Response> getPlansByCountry(apiToken, slug) => get('http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByCountry?appToken=${apiToken}&slug=${slug}');
  Future<Response> getCountryAndRegional() => get('https://auroraconnect.absoluit.com/api/api/Package/GetPackages?appToken=0acb027918aa87e13dccf920');
  Future<Response> getGlobalPlans() => get('http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByGlobal?appToken=0acb027918aa87e13dccf920');

  Future<Response> createOrderRequest(CreateOrderRequest request) => post('https://auroraconnect.absoluit.com/api/api/Order/CreateOrder',
      json.encode(<String, dynamic>{
    "quantity": request.quantity,
    "packageId": request.packageId,
    "userId": "",
    "planDetail": request.planDetail,
  }), headers: {
        "content-type" : "application/json ; charset=utf-8 ",
        "Accept": "application/json"
  });

}
