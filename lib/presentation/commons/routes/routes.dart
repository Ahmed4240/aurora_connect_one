import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:aurora_connect_one/presentation/screens/my_esim_details_screen.dart';
import 'package:aurora_connect_one/presentation/screens/my_orders_page.dart';
import 'package:flutter/material.dart';

import '../../screens/main_screen.dart';
import '../../screens/my_e_sims_page.dart';
import '../../screens/open_web_page_screen.dart';
import '../../screens/plan_details_screen.dart';
import '../../screens/plans_screen.dart';
import '../../screens/profile_page.dart';
import '../../screens/splash_screen.dart';

class Routes {
  //settings accept string parameter
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => MainScreen(
                  defaultIndex: 0,
                ));
      case RoutesName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfilePage());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.my_esim:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyE_SimsPage());
      // case RoutesName.plans:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>  const PlansScreen());
      case RoutesName.webview:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WebViewScreen());
      case RoutesName.my_esim_details:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyESIMDetailsScreen());
      case RoutesName.my_orders:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyOrdersPage());
      case RoutesName.plan_details:
      // return MaterialPageRoute(
      //     builder: (BuildContext context) =>  const PlanDetailsScreen());
      // case RoutesName.sample_screen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>  SampleScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
