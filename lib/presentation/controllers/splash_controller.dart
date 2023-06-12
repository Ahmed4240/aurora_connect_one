import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/main_screen.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await GetStorage.init();
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAll(() =>  const MainScreen());
      }
    );
  }
}
