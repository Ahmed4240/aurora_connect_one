
import 'package:get/get_connect/connect.dart';

class PlansProvider extends GetConnect {
  Future<Response> getPlansByCountry(apiToken, slug) => get('http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByCountry?appToken=${apiToken}&slug=${slug}');
  Future<Response> getCountryAndRegional() => get('https://auroraconnect.absoluit.com/api/api/Package/GetPackages?appToken=0acb027918aa87e13dccf920');
  Future<Response> getGlobalPlans() => get('http://auroraconnect.absoluit.com/api/api/Package/GetPackagesByGlobal?appToken=0acb027918aa87e13dccf920');
  // 0acb027918aa87e13dccf920
}
