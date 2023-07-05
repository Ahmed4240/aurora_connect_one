import 'package:flutter/material.dart';
import '../commons/app_colors.dart';
import 'constants.dart';

class CustomProgressIndicator {

   getCircularProgressIndicator(BuildContext? context) {
    if (context != null) {
      showDialog(
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return WillPopScope(
              onWillPop: () => Future.value(false),
              child: SimpleDialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        getProgressWidget(),
                      ],
                    ),
                  ]),
            );
          });
    }
  }

  Widget getProgressWidget() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }

  void stopCircularProgressIndicator(BuildContext? context) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }
}
