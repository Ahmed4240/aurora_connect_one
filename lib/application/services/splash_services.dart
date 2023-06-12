import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/view_models/user_view_model.dart';
import '../../presentation/commons/constants.dart';
import '../../presentation/commons/routes/routes_name.dart';

class SplashServices {
  //Trying to get the data which we stored as Shared Preferences
  //Getter method of UserViewModel

  Future<bool> saveUser() => UserViewModel().saveUser(K.appToken);

  Future<String> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async{
      print('appToken : $value');
      if (value == "null" || value.toString() == "") {
        await Future.delayed(const Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushNamed(context, RoutesName.home);      // my_esim_details

      } else {
       await Future.delayed(const Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.home);
       Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
