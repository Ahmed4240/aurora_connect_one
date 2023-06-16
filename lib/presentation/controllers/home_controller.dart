import 'package:get/get.dart';

import '../../domain/packages/global/GlobalPackagesResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../provider/plans_provider.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // getGlobalPlans();
    // getCountryAndRegionalPlans();
  }
  var model = LocalPackagesResponse().obs;
  var globalModel = GlobalPackagesResponse().obs;
  var localPlansResponse = LocalPackagesResponse().obs;
  var loading = false.obs;
  var globalPlans = GlobalPackagesResponse();
  var loadingGlobalData = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPackages() async {
    print('calling for getCountryAndRegionalPlans');
    loading(true);
    var response = await _provider.getCountryAndRegional();
    if (!response.status.hasError) {
      localPlansResponse.value = getLocalPackagesResponseFromJson(response.bodyString.toString());
    }
    loading(false);
  }
  getPackageGlobal() async {
    loading(true);
    var response = await _provider.getGlobalPlans();
    print(("get all packages globaly ${response.body}"));
    if (!response.status.hasError) {
      globalPlans = getGlobalPackagesResponseFromJson(response.bodyString.toString());
    }
    loading(false);
  }
}
