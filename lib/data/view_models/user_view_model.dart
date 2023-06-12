import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/commons/routes/routes_name.dart';

class UserViewModel with ChangeNotifier {
  //Saving User Data By shared Preferences
  Future<bool> saveUser(String user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.toString());
    notifyListeners();
    return true;
  }

  //Get the user value using shared preferences
  Future<String> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return token.toString();
  }

  //If user get log out we have to remove the session
  Future<bool> removeUser(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    sp.clear();
    Navigator.pushNamed(context, RoutesName.home);
    return true;
  }
}
