import 'package:aurora_connect_one/presentation/commons/routes/routes.dart';
import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:aurora_connect_one/presentation/widgets/constants.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection
      ],
      child: ResponsiveSizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          builder: BotToastInit(),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Aurora Connect',
          theme: ThemeData(
            primaryColor: const Color(0xff10CFA8),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.white,
            primarySwatch: Colors.blue,
            fontFamily: 'SourceSansPro',
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}
