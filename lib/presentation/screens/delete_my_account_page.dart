import 'package:aurora_connect_one/presentation/commons/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';

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
  late SizeConfig configSize;
  SingingCharacter? _character = SingingCharacter.IncompatibleDevice;

  @override
  Widget build(BuildContext context) {
    configSize = SizeConfig().init(context);
    Size screenSize = MediaQuery.of(context).size;
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
                              // _showAddWorkEmailBottomSheet(context, screenSize);
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
    );
  }
}
