import 'dart:async';
import 'dart:io';

import 'package:aurora_connect_one/presentation/provider/plans_provider.dart';
import 'package:aurora_connect_one/presentation/widgets/customToast.dart';
import 'package:aurora_connect_one/presentation/widgets/progressIndicator_mixins.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/plans/PlansInCountryResponse.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../commons/constants.dart';
import '../widgets/appException.dart';

class PlansController extends GetxController with CustomToast, CustomProgressIndicator{
  BuildContext ? context;
  PlansController(Plan model) {
    getPlansByCountry(K.appToken, model);
  }

  @override
  void onReady() {
    super.onReady();
  }

  handleError(e) {
    stopCircularProgressIndicator(context);
    errorToast(e.toString());
  }

  var localPlansResponse = PlansInCountryResponse();
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  getPlansByCountry(String apiToken, Plan model) async {
    loading(true);
    try{
      var response = await _provider.getPlansByCountry(apiToken, model.slug);
      if (!response.status.hasError) {

        localPlansResponse =
            getPlansInCountryResponseFromJson(response.bodyString.toString());
        print('localPlansResponse => ${PlansInCountryResponse}');
      }
    }catch(e){
      handleError(e);
      customExceptionHandler(e);

    }


    loading(false);
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
