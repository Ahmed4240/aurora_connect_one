import 'package:colorful_iconify_flutter/icons/noto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import 'app_colors.dart';

class K{
  static RxString doctorPicture = "".obs;
  static RxString doctorName = "false".obs;
  static RxString doctorSpeciality = "false".obs;

  static String appToken = "0acb027918aa87e13dccf920";

//Custom Snack Bar for Fail
  static SnackbarController customSnackBarSorry({
    required String message,
  }) {
    return Get.snackbar(
      "Sorry",
      message,
      icon: const Iconify(Noto.sad_but_relieved_face),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.mainColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static SnackbarController customSnackBarSuccess({
    required String message,
  }) {
    return Get.snackbar(
      "Successful",
      message,
      icon: const Iconify(Noto.beaming_face_with_smiling_eyes),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.mainColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}