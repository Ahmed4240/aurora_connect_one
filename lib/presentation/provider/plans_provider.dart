
import 'dart:convert';

import 'package:aurora_connect_one/domain/create_order/create_order_request.dart';
import 'package:get/get_connect/connect.dart';

class PlansProvider extends GetConnect {
  Future<Response> getPlansByCountry(apiToken, slug) =>
      get('http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByCountry?appToken=${apiToken}&slug=${slug}');

  Future<Response> getCountryAndRegional() =>
      get(
          'https://auroraconnect.absoluit.com/api/api/Package/GetPackages?appToken=0acb027918aa87e13dccf920');

  Future<Response> getGlobalPlans() =>
      get(
          'http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByGlobal?appToken=0acb027918aa87e13dccf920');

  Future<Response> getMyOrders() =>
      get('https://auroraconnect.absoluit.com/api/api/Order/GetAllOrdersByCustomer?userId=${"6df747ff-526c-4a79-a00b-3d09941e47cb"}');
}