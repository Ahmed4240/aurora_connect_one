// ignore_for_file: unnecessary_overrides, unused_import, unused_field

import 'package:aurora_connect_one/presentation/provider/plans_provider.dart';
import 'package:get/get.dart';

import '../../domain/plans/PlansInCountryResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../commons/constants.dart';

class ProfileController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var localProfileResponse = PlansInCountryResponse();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  // createUser(String apiToken, LocalPlan model) async {
  //   loading(true);
  //   var response = await _provider.getPlansByCountry(apiToken, model.slug);
  //   if (!response.status.hasError) {
  //     localProfileResponse =
  //         getPlansInCountryResponseFromJson(response.bodyString.toString());
  //     print('localPlansResponse => ${PlansInCountryResponse}');
  //   }
  //   loading(false);
  // }
}
