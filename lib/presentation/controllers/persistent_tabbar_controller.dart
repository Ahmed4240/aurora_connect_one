import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersistentTabBarController extends GetxController{
  RxInt currentIndex = 0.obs;
  Rx<PersistentTabController> controller = PersistentTabController(initialIndex: 0).obs;
  RxBool hideNavBar = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    controller.value = PersistentTabController(initialIndex: 0);
    hideNavBar.value = false;
  }
}