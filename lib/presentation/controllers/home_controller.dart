import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import '../../domain/packages/global/GlobalPackagesResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../provider/plans_provider.dart';
import '../widgets/appException.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var model = GetPackagesModel().obs;
  var loadingLocalData = false.obs;

  var globalModel = GetPackagesGlobal().obs;
  var loadingGlobalData = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPackages() async {
    try{
      print('calling for get packages');
      // loadingLocalData(true);
      var response = await _provider.getCountryAndRegional();
      print("get all packages ${response.body}");
      if (!response.status.hasError) {
        print("get all packages 1 ${response.body}");
        model.value = getPackagesModelFromJson(response.bodyString.toString());
      }
    }catch(e){
      customExceptionHandler(e);
    }

    // loadingLocalData(false);
  }


  getPackageGlobal() async{
    try{
      print("Calling get request globaly");
      // loadingGlobalData(true);
      var response =  await _provider.getGlobalPlans();
      print(("get all packages globaly ${response.body}"));
      if (!response.status.hasError) {
        print("get all packages 1 ${response.body}");
        globalModel.value = getPackagesGlobalFromJson(response.bodyString.toString());
      }
    }catch(e){
      customExceptionHandler(e);
    }

    // loadingGlobalData(false);
  }

  void customExceptionHandler(dynamic e) {
    switch (e.runtimeType) {
      case SocketException:
        throw AppException('Internet Connection is Not Available', 'Try Again');
      case TimeoutException:
        throw AppException('Request Time Out', 'Try Again');
      case int:
        throw getAppExceptionWRTCode(e);
      case AppException: // called when exception is thrown from _returnResponse Function.
        throw e;
      default:
        throw AppException('Oops! Something Went Wrong', "");
    }
  }

  AppException getAppExceptionWRTCode(dynamic code) {
    switch (code) {
      case 401:
        return AppException('Unauthorized Access', '');
      default:
        return AppException('Oops! Something Went Wrong', "");
    }
  }

}