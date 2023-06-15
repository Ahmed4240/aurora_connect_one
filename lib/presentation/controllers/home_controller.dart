import 'package:get/get.dart';

import '../../domain/packages/global/GlobalPackagesResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../provider/plans_provider.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getGlobalPlans();
    getCountryAndRegionalPlans();
  }

  var localPlansResponse = LocalPackagesResponse().obs;
  var globalPlans = GlobalPackagesResponse();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  getCountryAndRegionalPlans() async {
    print('calling for getCountryAndRegionalPlans');
    loading(true);
    var response = await _provider.getCountryAndRegional();
    if (!response.status.hasError) {
      localPlansResponse.value = getLocalPackagesResponseFromJson(response.bodyString.toString());
    }
    loading(false);
  }
  getGlobalPlans() async {
    loading(true);
    var response = await _provider.getGlobalPlans();
    if (!response.status.hasError) {
      globalPlans = getGlobalPackagesResponseFromJson(response.bodyString.toString());
    }
    loading(false);
  }
}
