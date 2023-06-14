import 'package:get/get.dart';

import '../../domain/create_order/create_order_request.dart';
import '../../domain/create_order/create_order_response.dart';
import '../../domain/get_package_by_global.dart';
import '../../domain/get_packages_model.dart';
import '../provider/plans_provider.dart';

class PlanDetailsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var createOrderResponse = CreateOrderResponse().obs;
  var loading = false.obs;

  final PlansProvider _provider = PlansProvider();

  createOrderRequest(CreateOrderRequest request) async {
    print('calling for createOrderRequest');
    loading(true);
    var response = await _provider.createOrderRequest(request);
    if (!response.status.hasError) {
      createOrderResponse.value = getCreateOrderResponse(response.bodyString.toString());
      if(createOrderResponse.value.data?.orderId != null){
        // signUpUserRequest(SignUpUserRequest);     // create sign up request here
        print('createOrderResponse.value : ${createOrderResponse.value.toString()}');
      }else{
        print('something is went wrong createOrderRequest');
      }
    }else{
      print('something is went wrong createOrderRequest Error : ${response.status.code}');
      print('something is went wrong createOrderRequest Error : ${response.statusText}');
    }
    loading(false);
  }

  signUpUserRequest(CreateOrderRequest request) async {
    print('calling for createOrderRequest');
    loading(true);
    var response = await _provider.createOrderRequest(request);
    if (!response.status.hasError) {
      createOrderResponse.value = getCreateOrderResponse(response.bodyString.toString());
    }
    loading(false);
  }

}
