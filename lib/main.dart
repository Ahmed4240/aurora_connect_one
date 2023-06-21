import 'package:aurora_connect_one/presentation/commons/routes/routes.dart';
import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:aurora_connect_one/presentation/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'data/view_models/user_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: KeyboardDismisser(
        gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
        child: ResponsiveSizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
              navigatorKey: navigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'Aurora Connect',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'SourceSansPro',
            ),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        }),
      ),
    );
  }
}

