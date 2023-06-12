import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';

class MyESIMDetailsScreen extends StatefulWidget {
  const MyESIMDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyESIMDetailsScreen> createState() => _MyESIMDetailsScreenState();
}

class _MyESIMDetailsScreenState extends State<MyESIMDetailsScreen> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 8,
                shadowColor: Colors.white30,
                child: Container(
                  color: AppColors.whiteColor,
                  width: screenSize.width,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 44.0, bottom: 18, left: 18.0, right: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            moveBack(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Marhaba",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Metropolis'),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                child: SizedBox(
                  height: screenSize.height * .863,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      const Text(
                        'eSIM installation',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.inActiveColorPrimary),
                      ),
                      Card(
                        color: AppColors.activeColorPrimary,
                        margin:
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 24.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.activate_esim_icon,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Activate eSIM',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Coverage',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  openCountriesBottomSheet();
                                },
                                child: const Text(
                                  'Turkey',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.inActiveColorPrimary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Data',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                '4 GB',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Validity',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                '7 days',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Data usage',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.inActiveColorPrimary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: AppColors.whiteColor,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        shadowColor: Colors.white30,
                        elevation: 5.0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 9.0,
                                    percent: 0.70,
                                      animation: true,
                                      animationDuration: 1200,
                                    center: const Text("4 GB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                    progressColor: Colors.green,
                                      circularStrokeCap: CircularStrokeCap.round
                                  ),
                                  const SizedBox(height: 8.0,),
                                  const Text(
                                    'Remaining data',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.inActiveColorPrimary),
                                  ),
                                ],
                              ),
                              SizedBox(height: 110.0, width: 2.0 ,child: Container(color: AppColors.lightGreyColor,),),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("0 MB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                      Text('Used data',
                                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,
                                            color: AppColors.inActiveColorPrimary),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("4 GB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                      Text('Total data',
                                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,
                                            color: AppColors.inActiveColorPrimary),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        'Buy top up packages',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.inActiveColorPrimary),
                      ),

                      const SizedBox(height: 10,),
                      Card(
                        color: AppColors.whiteColor,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        shadowColor: Colors.white30,
                        elevation: 5.0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("1 GB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                  Text('7 days',
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,
                                        color: AppColors.inActiveColorPrimary),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("7\$", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: AppColors.whiteColor,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        shadowColor: Colors.white30,
                        elevation: 5.0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("2 GB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                  Text('15 days',
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,
                                        color: AppColors.inActiveColorPrimary),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("15\$", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: AppColors.whiteColor,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        shadowColor: Colors.white30,
                        elevation: 5.0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("4 GB", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),),
                                  Text('30 days',
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,
                                        color: AppColors.inActiveColorPrimary),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("30\$", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  void openCountriesBottomSheet() {

  }
}
