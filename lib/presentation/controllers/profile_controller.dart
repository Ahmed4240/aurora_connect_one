import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/signup/SignUpResponse.dart';
import 'package:http/http.dart' as http;
import '../widgets/constants.dart';

class ProfileController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onReady() {
    super.onReady();
    initSharedPreference();
  }

  Future<void> initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  var signUpResponse = SignUpResponse().obs;

  Future<bool> signUpUserRequest() async {
      print('calling for signUpUserRequest ');
      // loading(true);
      final map = {
        "email": 'ahmedrehman123@gmail.com',
        "username": 'ahmedrehman123',
        "phone": '+923127113699'
      };
      const url = 'https://auroraconnect.absoluit.com/api/api/UserSignup';
      var response_1 = await http.post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: jsonEncode(map));

      print("Request: ${jsonEncode(map)}");
      if (response_1.statusCode == 200) {
        String responseString = response_1.body;
        if (prefs != null) {
          prefs.setString(USER_ID, signUpResponse.value.data?.userId ?? "");
          prefs.setString(USER_TOKEN, signUpResponse.value.data?.token ?? "");
          return true;
        }
        return true;
      } else {
        printError(info: "Response Error: ${response_1.body}");
        return false;
      }
  }
}
