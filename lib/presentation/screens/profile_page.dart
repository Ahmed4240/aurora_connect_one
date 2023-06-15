import 'package:aurora_connect_one/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../domain/create_order/create_order_request.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../../domain/plans/PlanDetail.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/routes/routes_name.dart';
import '../controllers/plans_controller.dart';
import '../controllers/plans_details_controller.dart';
import 'account_information_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  static const MethodChannel methodChannel = MethodChannel('example.com/channel');
  static const EventChannel eventChannel = EventChannel('example.com/channel');
  String _reportStatus = 'Game status: unknown.';

  Future<void> checkESIMCapability() async {
    try {
      eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
      await methodChannel.invokeMethod('checkESIMCapability');
    } on PlatformException catch (e) {
      debugPrint("Failed to Invoke: '${e.message}'.");
    }
  }

  void _onEvent(Object? event) {
    setState(() {
      _reportStatus = "Game status: $event";
    });
    debugPrint(_reportStatus);
  }

  void _onError(Object error) {
    setState(() {
      _reportStatus = 'Game status: unknown.';
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    checkESIMCapability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GetX<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                color: AppColors.backGroundColor,
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shadowColor: Colors.white30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 34.0, bottom: 24.0, left: 24.0, right: 24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 27),
                                ),
                                Text(
                                  'Emma Dahl',
                                  style: TextStyle(
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Image.asset(
                              AppImages.my_profile_filled_icon,
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        // openVippsApp(context);
                        // callForCreateOrder(context);
                      },
                      child: Card(
                        margin: const EdgeInsets.only(
                            top: 30, bottom: 5, left: 20, right: 20),
                        elevation: 8,
                        shadowColor: Colors.white30,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          alignment: Alignment.center,
                          color: AppColors.whiteColor,
                          width: screenSize.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Login/Signup',
                                style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Image.asset(
                                AppImages.my_profile_filled_icon,
                                width: 50,
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 5, left: 20, right: 20),
                      elevation: 8,
                      shadowColor: Colors.white30,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              openAccountInformation(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              alignment: Alignment.center,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    SvgPicture.asset(AppImages.account_information_profile_icon),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Account information',
                                        style: TextStyle(
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ]),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.inActiveColorPrimary,
                                    size: 18.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SizedBox(
                              width: screenSize.width,
                              height: 1,
                              child: Container(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              openWebView(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              alignment: Alignment.center,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    SvgPicture.asset(AppImages.my_orders_icon),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'My orders',
                                        style: TextStyle(
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ]),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.inActiveColorPrimary,
                                    size: 18.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SizedBox(
                              width: screenSize.width,
                              height: 1,
                              child: Container(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.whiteColor,
                            width: screenSize.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(AppImages.languages_icon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Languages',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                ]),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.inActiveColorPrimary,
                                  size: 18.0,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Card(
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 5, left: 20, right: 20),
                      elevation: 8,
                      shadowColor: Colors.white30,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.whiteColor,
                            width: screenSize.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(AppImages.privacy_policy_icon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Privacy policy',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                ]),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.inActiveColorPrimary,
                                  size: 18.0,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SizedBox(
                              width: screenSize.width,
                              height: 1,
                              child: Container(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              openWebView(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              alignment: Alignment.center,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    SvgPicture.asset(AppImages.term_of_use_icon),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Terms of use',
                                        style: TextStyle(
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ]),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.inActiveColorPrimary,
                                    size: 18.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SizedBox(
                              width: screenSize.width,
                              height: 1,
                              child: Container(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.whiteColor,
                            width: screenSize.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(AppImages.contact_help_center_icon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Contact help center',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                ]),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.inActiveColorPrimary,
                                  size: 18.0,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SizedBox(
                              width: screenSize.width,
                              height: 1,
                              child: Container(
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.whiteColor,
                            width: screenSize.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(AppImages.rate_us_icon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Rate Aurora Connect',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                ]),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.inActiveColorPrimary,
                                  size: 18.0,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Card(
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 5, left: 20, right: 20),
                      elevation: 8,
                      shadowColor: Colors.white30,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.whiteColor,
                            width: screenSize.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(AppImages.logout_icon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.red,
                                          fontSize: 18),
                                    ),
                                  ),
                                ]),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.inActiveColorPrimary,
                                  size: 18.0,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  openWebView(BuildContext context) {
    print('open web-view is called now');
    Navigator.pushNamed(context, RoutesName.webview);
  }

  Future<void> openVippsApp(BuildContext context) async {
    print("open vipps app clicked");
    const platform = MethodChannel('example.com/channel');
    try {
      await platform.invokeMethod('openVippsApp');
    } on PlatformException catch (e) {}
  }

  Future<void> callForCreateOrder(BuildContext context, PlanDetailsController controller, PlanDetail model) async {
    if(model != null){
      CreateOrderRequest request = CreateOrderRequest();
      request.quantity = 1;
      request.packageId = model.id.toString();
      request.planDetail = model;
      request.userId = "fbf8e2e2-3621-4ad6-96ad-7f43cd043988";

      print('calling before createOrderRequest request : ${request.toJson()}');
      controller.createOrderRequest(request);
    }
  }

  void openAccountInformation(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AccountInformationPage(),),
    );
  }
}
