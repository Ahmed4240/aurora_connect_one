import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../application/services/splash_services.dart';
import '../../data/view_models/user_view_model.dart';
import '../commons/app_images.dart';
import '../commons/constants.dart';
import '../commons/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Initializing the splash services
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    UserViewModel().saveUser(K.appToken);
    splashServices.checkAuthentication(context);

    navigateToHome(context);
  }

  Future<void> navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamed(context, RoutesName.home);

    // Navigator.pushNamed(context, RoutesName.sample_screen);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: height,
          width: width * .7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.appLogo,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
