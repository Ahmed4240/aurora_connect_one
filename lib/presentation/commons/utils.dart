import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static double averageRating(List<int> rating)
  {
    var avgRating = 0;
    for(int i = 0;i<rating.length; i++){
      avgRating= avgRating +rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }
  //On pressing done from keyboard it should move to the next text field
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentNode,
    FocusNode nextNode,
  ) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  //For showing toast
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static var sampleInformation = "This eSIM does not cover Northern Cyprus. If you plan to use your eSIM data for 91 days (accumulated) or more in a 120-day period, you must register your device's IMEI number on Turkey's Central Equipment Identification Register (CEIR) and pay a one-time tax.";
  static var terms_and_condition = "By completing the order, you agree to our Terms & conditions and Privacy policy.";
  static var terms_and_condition1 = "Before completing this order, please confirm that your device is eSIM compatible and network-unlocked.";
  static var reasons_info = "You can delete your account permanently after choosing a reason a giving more details to tell us why you’re deleting your account. (optional).";
  static var requesting_personal_data = "We will send an email to your registered email address with a file containing your personal data stored in Aurora Connect app.\n\nTap button to continue.";
}
