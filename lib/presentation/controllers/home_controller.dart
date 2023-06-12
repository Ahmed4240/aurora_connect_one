import 'package:get/get.dart';

import '../../domain/get_package_by_global.dart';
import '../../domain/get_packages_model.dart';
import '../provider/plans_provider.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getCountryAndRegionalPlans();
    getGlobalPlans();
  }

  var countryPlans = GetPackages().obs;
  var globalPlans = GetPackagesByGlobal();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  getCountryAndRegionalPlans() async {
    print('calling for getCountryAndRegionalPlans');
    loading(true);
    var response = await _provider.getCountryAndRegional();
    if (!response.status.hasError) {
      countryPlans.value = getPackagesFromJson(response.bodyString.toString());
    }
    loading(false);
  }
  getGlobalPlans() async {
    loading(true);
    var response = await _provider.getGlobalPlans();
    if (!response.status.hasError) {
      globalPlans = getPackagesByGlobalFromJson(response.bodyString.toString());
    }
    loading(false);
  }
}
