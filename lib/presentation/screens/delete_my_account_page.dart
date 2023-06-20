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

class _DeleteMyAccountPageState extends State<DeleteMyAccountPage> {
  late SizeConfig configSize;

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
                height: screenSize.height * 0.1,
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.white30,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 2.0, left: 24.0, right: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Delete my account',
                              style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0),
                            )
                          ],
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
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
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
                    const SizedBox(height: 5.0,),
                    Text(
                      Utils.reasons_info,
                      style: const TextStyle(
                          fontFamily: 'Metropolis',
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),

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
