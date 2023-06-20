import 'package:aurora_connect_one/presentation/controllers/profile_controller.dart';
import 'package:aurora_connect_one/presentation/screens/my_orders_page.dart';
import 'package:aurora_connect_one/presentation/screens/privacy_policy_page.dart';
import 'package:aurora_connect_one/presentation/screens/terms_and_conditions_page.dart';
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
import 'Contact_page.dart';
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
    // checkESIMCapability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                        openMyOrdersPage(context);
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
                    InkWell(
                      onTap: (){
                        openPrivacyPolicy(context);
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
                        openTermsAndConditions(context);
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
                    InkWell(
                      onTap: (){
                        openContactUsPage(context);
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
                      onTap: (){
                        _showRateUsBottomSheet(context, screenSize);
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              InkWell(
                onTap: (){
                  _showLogoutBottomSheet(context, screenSize);
                },
                child: Card(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
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


  void openAccountInformation(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AccountInformationPage(),),
    );
  }

  void openMyOrdersPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const MyOrdersPage(),),
    );
  }

  void openPrivacyPolicy(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PrivacyPolicyPage(),),
    );
  }

  void openTermsAndConditions(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TermsAndConditionsPage(),),
    );
  }

  void openContactUsPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ContactUsPage(),),
    );
  }

  void _showLogoutBottomSheet(BuildContext context, Size screenSize) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: screenSize.height * 0.25,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Logout',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                          color: AppColors.whiteColor,
                          elevation: 2.0,
                          shadowColor: Colors.white54,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45))),
                          child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(AppImages.cross_icon)),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Are you sure you want to Logout?", style: TextStyle(fontWeight: FontWeight.w300),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  color: AppColors.transparentColor,
                  width: screenSize.width,
                  height: screenSize.height * .075,
                  child: GestureDetector(
                    onTap: () {
                      // openVippsApp(context);
                    },
                    child: const Card(
                      color: AppColors.redColor,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      elevation: 5.0,
                      shadowColor: Colors.white30,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRateUsBottomSheet(BuildContext context, Size screenSize) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: screenSize.height * 0.30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rate this app',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                          color: AppColors.whiteColor,
                          elevation: 2.0,
                          shadowColor: Colors.white54,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45))),
                          child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(AppImages.cross_icon)),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: const [
                          Center(child: Text("If you enjoy using this app, would you \nmind to taking a moment to rate it? Thank \nyou for your support!", style: TextStyle(fontWeight: FontWeight.w300),))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  color: AppColors.transparentColor,
                  width: screenSize.width,
                  height: screenSize.height * .075,
                  child: GestureDetector(
                    onTap: () {
                      // openVippsApp(context);
                    },
                    child: const Card(
                      color: AppColors.redColor,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      elevation: 5.0,
                      shadowColor: Colors.white30,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: Center(
                          child: Text(
                            'Rate us',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
