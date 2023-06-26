import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/account_info/account_information_request.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';
import '../controllers/account_information_controller.dart';
import '../widgets/constants.dart';

class DeleteMyAccountPage extends StatefulWidget {
  const DeleteMyAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteMyAccountPage> createState() => _DeleteMyAccountPageState();
}

enum SingingCharacter {
  IncompatibleDevice,
  DigitalFootPrint,
  NoLongerNeed,
  PoorCustomerService,
  BadUserExperience,
  Other
}

class _DeleteMyAccountPageState extends State<DeleteMyAccountPage> {
  SingingCharacter? _character = SingingCharacter.IncompatibleDevice;

  final controller = Get.put(AccountInformationController());

  String? userNameString, userEmailString, userPhoneString, userIdString, userTokenString;

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs != null){
      userNameString = prefs.getString(USER_NAME);
      userEmailString = prefs.getString(USER_EMAIL);
      userPhoneString = prefs.getString(USER_PHONE);
      userIdString = prefs.getString(USER_ID);
      userTokenString = prefs.getString(USER_TOKEN);

      print('user information : \n'
          'user id : ${userIdString!} \n'
          'user token : ${userTokenString!} \n');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for data, display a loading spinner or any other loading indicator
          return const Center(child: SizedBox(height: 50.0, width: 50.0, child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          // If an error occurred during data fetching, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // If data fetching is successful, build your widget tree using the retrieved data
          // Access the retrieved data through snapshot.data
          return SafeArea(
            child: SingleChildScrollView(
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
                                onTap: (){
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
                                    'Delete my account',
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
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choose a reason',
                            style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            Utils.reasons_info,
                            style: const TextStyle(
                                fontFamily: 'Metropolis',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                          const SizedBox(height: 10.0,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('Incompatible device'),
                                      value: SingingCharacter.IncompatibleDevice,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('Digital footprint'),
                                      value: SingingCharacter.DigitalFootPrint,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('No longer in need'),
                                      value: SingingCharacter.NoLongerNeed,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('Poor customer service'),
                                      value: SingingCharacter.PoorCustomerService,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('Bad user experience'),
                                      value: SingingCharacter.BadUserExperience,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                    child: RadioListTile<SingingCharacter>(
                                      title: const Text('Other'),
                                      value: SingingCharacter.Other,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 7,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            labelText: 'Other comments (optional)',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10.0),
                                color: AppColors.transparentColor,
                                width: screenSize.width,
                                height: screenSize.height * .08,
                                child: GestureDetector(
                                  onTap: () {
                                    deleteAccountMethod(context);
                                  },
                                  child: Card(
                                    color: AppColors.redColor,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    elevation: 5.0,
                                    shadowColor: Colors.white30,
                                    shape: const RoundedRectangleBorder(
                                        side:
                                        BorderSide(color: Colors.white, width: 1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(45))),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                            child: Text(
                                              'Delete account',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ); // Replace YourWidget with your own widget
        }
      },
    );
  }

  Future<void> deleteAccountMethod(BuildContext context) async {
    Future<bool> requestStatus = controller.getDeleteMyUser(userIdString!, userTokenString!);
    if(await requestStatus){
      Navigator.pop(context);
    }else{
      Utils.snackBar("Something went wrong", context);
    }
  }
}
