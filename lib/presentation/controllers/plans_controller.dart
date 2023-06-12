import 'package:aurora_connect_one/presentation/provider/plans_provider.dart';
import 'package:get/get.dart';

import '../../domain/get_packages_by_country.dart';
import '../../domain/get_packages_model.dart';
import '../commons/constants.dart';

class PlansController extends GetxController {
  PlansController(Plan model) {
    getPlansByCountry(K.appToken, model);
  }

  @override
  void onReady() {
    super.onReady();
  }

  var countryPlans = GetPackagesByCountryModel();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPlansByCountry(String apiToken, Plan model) async {
    loading(true);
    var response = await _provider.getPlansByCountry(apiToken, model.slug);
    if (!response.status.hasError) {
      countryPlans =
          getPackagesByCountryFromJson(response.bodyString.toString());
      print('countryPlans => ${countryPlans}');
    }
    loading(false);
  }
}
