import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';

class DownloadMyAccountPage extends StatefulWidget {
  const DownloadMyAccountPage({Key? key}) : super(key: key);

  @override
  State<DownloadMyAccountPage> createState() => _DownloadMyAccountPageState();
}

class _DownloadMyAccountPageState extends State<DownloadMyAccountPage> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                              'Download my data',
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
                      'Requesting personal data',
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      Utils.requesting_personal_data,
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
                        const SizedBox(height: 30.0,),
                        Container(
                          color: AppColors.transparentColor,
                          width: screenSize.width,
                          height: screenSize.height * .06,
                          child: GestureDetector(
                            onTap: () {
                              // _showAddWorkEmailBottomSheet(context, screenSize);
                            },
                            child: Card(
                              color: AppColors.activeColorPrimary,
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
                                    'Download my data',
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
