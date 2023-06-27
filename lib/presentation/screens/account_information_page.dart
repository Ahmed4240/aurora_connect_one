import 'package:aurora_connect_one/domain/account_info/account_information_request.dart';
import 'package:aurora_connect_one/domain/remove_work_email/remove_work_email_request.dart';
import 'package:aurora_connect_one/domain/update_work_email/update_work_email_request.dart';
import 'package:aurora_connect_one/presentation/commons/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../controllers/account_information_controller.dart';
import '../widgets/constants.dart';
import 'delete_my_account_page.dart';
import 'download_my_data_page.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  final controller = Get.put(AccountInformationController());

  String? userNameString,
      userEmailString,
      userPhoneString,
      userIdString,
      userTokenString;

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      userNameString = prefs.getString(USER_NAME);
      userEmailString = prefs.getString(USER_EMAIL);
      userPhoneString = prefs.getString(USER_PHONE);
      userIdString = prefs.getString(USER_ID);
      userTokenString = prefs.getString(USER_TOKEN);

      print('user information : \n'
          'user id : ${userIdString!} \n'
          'user token : ${userTokenString!} \n');

      await controller.getAccountInformation(
          AccountInformationRequest(userId: userIdString), userTokenString!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for data, display a loading spinner or any other loading indicator
            return const Center(
                child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            // If an error occurred during data fetching, display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If data fetching is successful, build your widget tree using the retrieved data
            // Access the retrieved data through snapshot.data
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  width: screenSize.width,
                  color: AppColors.backGroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenSize.width,
                        height: screenSize.height * 0.1,
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.white30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25.0, bottom: 2.0, left: 24.0, right: 24.0),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 55.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        AppImages.back_arrow_icon,
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width,
                                  child: const Center(
                                    child: Text(
                                      'Account information',
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 15, right: 15),
                            elevation: 5,
                            shadowColor: Colors.white30,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 15.0),
                              alignment: Alignment.centerLeft,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    controller.accountInfoResponse.value.data
                                            ?.username ??
                                        '---',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            elevation: 5,
                            shadowColor: Colors.white30,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 15.0),
                              alignment: Alignment.centerLeft,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Phone',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    controller.accountInfoResponse.value.data
                                            ?.phone ??
                                        '---',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            elevation: 5,
                            shadowColor: Colors.white30,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 15.0),
                              alignment: Alignment.centerLeft,
                              color: AppColors.whiteColor,
                              width: screenSize.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    controller.accountInfoResponse.value.data
                                            ?.email ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller
                                    .accountInfoResponse.value.data?.workEmail !=
                                null,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 15, right: 15),
                              elevation: 5,
                              shadowColor: Colors.white30,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 15.0),
                                alignment: Alignment.centerLeft,
                                color: AppColors.whiteColor,
                                width: screenSize.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Work email',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.accountInfoResponse.value
                                                  .data?.workEmail ??
                                              '',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Metropolis',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _showRemoveEmailBottomSheet(
                                                context, screenSize, controller.accountInfoResponse.value
                                                .data?.workEmail ?? '');
                                          },
                                          child: Card(
                                            elevation: 1,
                                            color: Colors.red.shade100,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SvgPicture.asset(
                                                  AppImages.delete_icon,
                                                  color: Colors.red,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: controller
                                    .accountInfoResponse.value.data?.workEmail ==
                                null,
                            child: Container(
                              color: AppColors.transparentColor,
                              width: screenSize.width * 0.55,
                              height: screenSize.height * .055,
                              child: GestureDetector(
                                onTap: () {
                                  _showAddWorkEmailBottomSheet(
                                      context, screenSize);
                                },
                                child: Card(
                                  color: AppColors.activeColorPrimary,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  elevation: 5.0,
                                  shadowColor: Colors.white30,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(45))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                        'Work email',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0, top: 25.0),
                            child: Text(
                              'Account control',
                              style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              openDeleteMyAccountPage(context);
                            },
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 5, left: 20, right: 20),
                              elevation: 8,
                              shadowColor: Colors.white30,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          SvgPicture.asset(AppImages.delete_icon),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Delete my account',
                                              style: TextStyle(
                                                  fontFamily: 'Metropolis',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.red),
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
                          ),
                          InkWell(
                            onTap: () {
                              openDownloadMyAccountPage(context);
                            },
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 5, left: 20, right: 20),
                              elevation: 8,
                              shadowColor: Colors.white30,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          SvgPicture.asset(
                                              AppImages.download_my_data_icon),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Download my data',
                                              style: TextStyle(
                                                  fontFamily: 'Metropolis',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ); // Replace YourWidget with your own widget
          }
        },
      ),
    );
  }

  void openDeleteMyAccountPage(BuildContext context) {
    // Navigator.pushNamed(context, RoutesName.plan_details);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeleteMyAccountPage(),
      ),
    );
  }

  void openDownloadMyAccountPage(BuildContext context) {
    // Navigator.pushNamed(context, RoutesName.plan_details);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DownloadMyAccountPage(),
      ),
    );
  }

  void _showAddWorkEmailBottomSheet(BuildContext context, Size screenSize) {
    bool _value = false;
    final TextEditingController emailController = TextEditingController();

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
          height: screenSize.height * 0.35,
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
                        'Add work email',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                          color: AppColors.whiteColor,
                          elevation: 5.0,
                          shadowColor: AppColors.lightGreyColor,
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
                    SizedBox(
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.white54,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              width: screenSize.width * 0.9,
                              child: TextField(
                                controller: emailController,
                                style: const TextStyle(
                                    decoration: TextDecoration.none),
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.only(start: 10.0),
                                    labelText: "Email",),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _value = !_value;
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.blue),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _value
                                      ? const Icon(
                                          Icons.check,
                                          size: 20.0,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.check_box_outline_blank,
                                          size: 20.0,
                                          color: Colors.blue,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Send receipts on work email.",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: AppColors.transparentColor,
                  width: screenSize.width,
                  height: screenSize.height * .075,
                  child: GestureDetector(
                    onTap: () {
                      if(emailController.text != null && emailController.text != "")
                        {
                          prepareRequestForUpdateEmail(
                              context, emailController.text);
                        }else{
                        Utils.snackBar("Please add work email...", context);
                      }
                    },
                    child: const Card(
                      color: AppColors.activeColorPrimary,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      elevation: 5.0,
                      shadowColor: Colors.white30,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: Center(
                          child: Text(
                        'Add email',
                        style: TextStyle(color: Colors.white),
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

  void _showRemoveEmailBottomSheet(BuildContext context, Size screenSize, String workEmail) {
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
            padding: const EdgeInsets.all(12.0),
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
                        'Remove work email',
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
                        children: [
                          Center(
                              child: RichText(
                                text: TextSpan(
                                  text:
                                  'Are you sure you want to remove your work \nemail ',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' ${workEmail.toString()}.',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                          ),
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
                      prepareRequestForRemoveEmail(context);
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
                        'Remove email',
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

  Future<void> prepareRequestForUpdateEmail(
      BuildContext context, String email) async {
    Future<bool> requestStatus = controller.updateWorkEmail(
        UpdateWorkEmailRequest(
            isReceiptOnWorkEmail: true,
            workEmail: email,
            userId: userIdString!),
        userTokenString!);
    if (await requestStatus) {
      Utils.snackBar("Work email added successfully!", context);
      Navigator.pop(context);
    } else {
      Utils.snackBar("Something went wrong", context);
    }
  }

  Future<void> prepareRequestForRemoveEmail(BuildContext context) async {
    Future<bool> requestStatus = controller.removeWorkEmail(
        RemoveWorkEmailRequest(userId: userIdString!), userTokenString!);
    if (await requestStatus) {
      Utils.snackBar("Work email removed successfully!", context);
      Navigator.pop(context);
      getData();
    } else {
      Utils.snackBar("Something went wrong", context);
    }
  }
}
