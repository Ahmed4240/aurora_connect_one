import 'package:get/get.dart';
import '../../domain/packages/global/GlobalPackagesResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../provider/plans_provider.dart';

class HomeController extends GetxController {


  @override
  void onReady() async{
    super.onReady();
    // await getPackages();
    //  getPackageGlobal();
  }

  var model = GetPackagesModel().obs;
  var loading = false.obs;

  var globalModel = GetPackagesGlobal().obs;
  var loadingGlobalData = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPackages() async {

    print('calling for get packages');
    // loading(true);
    var response = await _provider.getCountryAndRegional();
    print("get all packages ${response.body}");
    if (!response.status.hasError) {
      print("get all packages 1 ${response.body}");
      model.value = getPackagesModelFromJson(response.bodyString.toString());
    }
    // loading(false);
  }


  getPackageGlobal() async{
    print("Calling get request globaly");
    // loadingGlobalData(true);
    var response =  await _provider.getGlobalPlans();
    print(("get all packages globaly ${response.body}"));
    if (!response.status.hasError) {
      print("get all packages 1 ${response.body}");
      globalModel.value = getPackagesGlobalFromJson(response.bodyString.toString());
    }
    // loadingGlobalData(false);
  }

}