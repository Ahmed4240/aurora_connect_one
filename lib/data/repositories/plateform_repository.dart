
import 'package:flutter/services.dart';

class PlatformRepository {
  static const platform = MethodChannel('flutter.native/helper');

  Future<String> changeColor(String eventFrom, String color) async {
    try {
      final String result = await platform.invokeMethod("changeColor", {
        "color": color,
      });
      print('RESULT -> $eventFrom : $result');
      color = result;
    } on PlatformException catch (e) {
      print(e);
    }
    return color;
  }
}