import 'package:aurora_connect_one/presentation/provider/plans_provider.dart';
import 'package:get/get.dart';

import '../../domain/plans/PlansInCountryResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../commons/constants.dart';

class PlansController extends GetxController {
  PlansController(Plan model) {
    getPlansByCountry(K.appToken, model);
  }

  @override
  void onReady() {
    super.onReady();
  }

  var localPlansResponse = PlansInCountryResponse();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPlansByCountry(String apiToken, Plan model) async {
    loading(true);
    var response = await _provider.getPlansByCountry(apiToken, model.slug);
    if (!response.status.hasError) {
      localPlansResponse =
          getPlansInCountryResponseFromJson(response.bodyString.toString());
      print('localPlansResponse => ${PlansInCountryResponse}');
    }
    loading(false);
  }
}
