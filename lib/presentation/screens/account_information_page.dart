import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bottom_sheets/add_work_email.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
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
                  padding: const EdgeInsets.only(
                      top: 34.0, bottom: 24.0, left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 25.0),
                        child: SvgPicture.asset(
                          AppImages.back_arrow_icon,
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Account Information',
                            style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.only(
                        top: 30, bottom: 5, left: 20, right: 20),
                    elevation: 8,
                    shadowColor: Colors.white30,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                          TextFormField(
                            textAlign: TextAlign.left,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Emma Dahl',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 5, left: 20, right: 20),
                    elevation: 8,
                    shadowColor: Colors.white30,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                          TextFormField(
                            textAlign: TextAlign.left,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '+47 00000000',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 5, left: 20, right: 20),
                    elevation: 8,
                    shadowColor: Colors.white30,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                          TextFormField(
                            textAlign: TextAlign.left,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'emma.watson444@gmail.com',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    color: AppColors.transparentColor,
                    width: screenSize.width * 0.45,
                    height: screenSize.height * .06,
                    child: GestureDetector(
                      onTap: () {
                        _showAddWorkEmailBottomSheet(context);
                      },
                      child: Card(
                        color: AppColors.activeColorPrimary,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        elevation: 5.0,
                        shadowColor: Colors.white30,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Account control',
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey),
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
                  Card(
                    margin: const EdgeInsets.only(
                        top: 8, bottom: 5, left: 20, right: 20),
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
                                SvgPicture.asset(AppImages.download_my_data_icon),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// void openPlanDetails(BuildContext context, PlansDatum model) {
//   // Navigator.pushNamed(context, RoutesName.plan_details);
//   Navigator.push(context,
//     MaterialPageRoute(builder: (context) => PlanDetailsScreen(model: model),
//     ),
//   );
// }

  void _showAddWorkEmailBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddWorkEmailBottomSheet();
      },
    );
  }
}
