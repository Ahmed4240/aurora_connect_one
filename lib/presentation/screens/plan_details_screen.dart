// ignore_for_file: use_build_context_synchronously

import 'package:aurora_connect_one/domain/create_order/create_order_request.dart';
import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:aurora_connect_one/presentation/widgets/progressIndicator_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/plans/PlanDetail.dart';
import '../commons/AppStyles.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';
import '../controllers/plans_details_controller.dart';

class PlanDetailsScreen extends StatefulWidget {
  const PlanDetailsScreen({super.key, required this.model});

  final PlanDetail model;

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen>
    with CustomProgressIndicator {
  var loadingPercentage = 0;

  String getCoverage(PlanDetail model) {
    String countries = "";
    if (model.countryList != null) {
      if (model.countryList!.length > 1) {
        countries = "${model.countryList!.length} countries";
      } else {
        countries = model.countryList![0]?.countryName as String;
      }
    }

    return countries;
  }

  bool value2 = true;
  bool value1 = true;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetX<PlanDetailsController>(
        init: PlanDetailsController(),
        builder: (controller) {
          var localData = controller.createOrderResponse.value;
          if (localData != null) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.backGroundColor,
                    width: screenSize.width,
                    height: screenSize.height * .11,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 0.0, left: 18.0, right: 18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              moveBack(context);
                            },
                            child: Card(
                              color: AppColors.whiteColor,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10.0, right: 10.0),
                              elevation: 5.0,
                              shadowColor: AppColors.lightGreyColor,
                              shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(45))),
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child:
                                      SvgPicture.asset(AppImages.cross_icon)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 24.0, right: 24.0),
                    child: SizedBox(
                      height: screenSize.height * .76,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            width: screenSize.width,
                            height: screenSize.height * 0.25,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      (widget.model.providerImage as String)),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.model.providerName as String,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  '\$ ${widget.model.price}',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Coverage',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      getCoverage(widget.model).toString(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              AppColors.inActiveColorPrimary),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Data',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      widget.model.data1.toString(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              AppColors.inActiveColorPrimary),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Validity',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      widget.model.validity.toString(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              AppColors.inActiveColorPrimary),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Buy top up packages',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.inActiveColorPrimary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100.0,
                            width: 300.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: 180.0,
                                  child: Card(
                                    color: AppColors.whiteColor,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    shadowColor: Colors.white30,
                                    elevation: 5.0,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 35.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "1 GB",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                '7 days',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .inActiveColorPrimary),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 60.0,
                                            width: 1,
                                            child: Container(
                                              color: AppColors.lightGreyColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "7\$",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 180.0,
                                  child: Card(
                                    color: AppColors.whiteColor,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    shadowColor: Colors.white30,
                                    elevation: 5.0,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 35.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "2 GB",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                '15 days',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .inActiveColorPrimary),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 60.0,
                                            width: 1,
                                            child: Container(
                                              color: AppColors.lightGreyColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "15\$",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 180.0,
                                  child: Card(
                                    color: AppColors.whiteColor,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    shadowColor: Colors.white30,
                                    elevation: 5.0,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 35.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "4 GB",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                '30 days',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .inActiveColorPrimary),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 60.0,
                                            width: 1,
                                            child: Container(
                                              color: AppColors.lightGreyColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "30\$",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Additional info',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.inActiveColorPrimary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            color: AppColors.whiteColor,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            shadowColor: Colors.white30,
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 25.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.netwok_icon),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Network',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors
                                                      .inActiveColorPrimary),
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          AppImages.plan_type_icon),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Plan type',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors
                                                      .inActiveColorPrimary),
                                            ),
                                            Text(
                                              widget.model.planType.toString(),
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          AppImages.information_icon),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Information',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors
                                                      .inActiveColorPrimary),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * .6,
                                              child: Text(
                                                Utils.sampleInformation,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.transparentColor,
                    width: screenSize.width,
                    height: screenSize.height * .06,
                    child: GestureDetector(
                      onTap: () {
                        showPaymentBottomSheet(context, screenSize, controller);
                      },
                      child: const Card(
                        color: AppColors.activeColorPrimary,
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        elevation: 5.0,
                        shadowColor: Colors.white30,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        child: Center(
                            child: Text(
                          '\$ 20.00 - Pay',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("Data not found!");
          }
        });
  }

  moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> openVippsApp(BuildContext context) async {
    const platform = MethodChannel('example.com/channel');
    int random;
    try {
      await platform.invokeMethod('getRandomNumber');
    } on PlatformException catch (e) {
      random = 0;
    }
  }

  Future<void> callForCreateOrder(BuildContext context,
      PlanDetailsController controller, PlanDetail model) async {
    CreateOrderRequest request = CreateOrderRequest();
    request.quantity = 1;
    request.packageId = model.id.toString();
    request.planDetail = model;
    Navigator.pop(context);
    getCircularProgressIndicator(context);
    await controller.createOrderRequest(request, context);
    print("Stoping circuller bar");
    stopCircularProgressIndicator(context);
    await Get.toNamed(RoutesName.my_orders);
  }

  void openPlanDetails(BuildContext context, int index) async {
    await Get.toNamed(RoutesName.home);
  }

  void showPaymentBottomSheet(
      BuildContext context, Size screenSize, PlanDetailsController controller) {
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
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * .03,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, left: 18.0, right: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pay with Vipps',
                          style: AppStyles.largeTextStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            moveBack(context);
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: screenSize.width,
                      child: Row(
                        children: [
                          Checkbox(
                            value: value1,
                            onChanged: (bool? value) {
                              setState(() {
                                value1 = !value1;
                              });
                            },
                          ),
                          SizedBox(
                            width: screenSize.width * .8,
                            child: RichText(
                              text: const TextSpan(
                                text:
                                    'By completing the order, you agree to our',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' terms & conditions',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: 'Privacy policy.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: value2,
                          onChanged: (bool? value) {
                            setState(() {
                              value2 = !value2;
                            });
                          },
                        ),
                        SizedBox(
                          width: screenSize.width * .8,
                          child: RichText(
                            text: TextSpan(
                              text: Utils.terms_and_condition1,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                              children: const <TextSpan>[],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: AppColors.transparentColor,
                  width: screenSize.width,
                  height: screenSize.height * .06,
                  child: GestureDetector(
                    onTap: () async {
                      print("this working");
                      await callForCreateOrder(
                          context, controller, widget.model);
                      // Future.delayed(
                      //   const Duration(seconds: 5),
                      //       () => setState(() => _isLoading = false),
                      // );
                      // moveBack(context);
                    },
                    child: Card(
                      color: AppColors.activeColorPrimary,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      elevation: 5.0,
                      shadowColor: Colors.white30,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: Center(
                          child: _isLoading == true
                              ? const Text(
                                  'creating order...',
                                  style: TextStyle(color: Colors.white),
                                )
                              : const Text(
                                  '\$ 20.00 - Pay with vipps',
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
}
