import 'package:aurora_connect_one/domain/create_order/create_order_request.dart';
import 'package:aurora_connect_one/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../domain/plans/PlanDetail.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';
import '../controllers/plans_details_controller.dart';
import '../widgets/payment_bottom_sheet.dart';

class PlanDetailsScreen extends StatefulWidget {

  const PlanDetailsScreen({super.key, required this.model});

  final PlanDetail model;

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
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

  bool value = false;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return GetX<PlanDetailsController>(
        init: PlanDetailsController(),
        builder: (controller) {
          var localData = controller.createOrderResponse.value;
          if (localData != null) {
            print("Order id : ${localData.data?.orderId}");
            return Scaffold(
                backgroundColor: AppColors.backGroundColor,
                body: Column(
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
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  elevation: 5.0,
                                  shadowColor: AppColors.lightGreyColor,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(45))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SvgPicture.asset(AppImages.cross_icon)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24.0),
                        child: SizedBox(
                          height: screenSize.height * .783,
                          child: ListView(
                            shrinkWrap: true,
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
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${widget.model.providerName as String}',
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
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              color: AppColors.inActiveColorPrimary),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("1 GB", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 18.0),),
                                                  Text('7 days',
                                                    style: TextStyle(fontSize: 14.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors
                                                            .inActiveColorPrimary),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 60.0,
                                                width: 1,
                                                child: Container(
                                                  color: AppColors.lightGreyColor,),),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("7\$", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 16.0),),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("2 GB", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 18.0),),
                                                  Text('15 days',
                                                    style: TextStyle(fontSize: 14.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors
                                                            .inActiveColorPrimary),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 60.0,
                                                width: 1,
                                                child: Container(
                                                  color: AppColors.lightGreyColor,),),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("15\$", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 16.0),),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("4 GB", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 18.0),),
                                                  Text('30 days',
                                                    style: TextStyle(fontSize: 14.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors
                                                            .inActiveColorPrimary),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 60.0,
                                                width: 1,
                                                child: Container(
                                                  color: AppColors.lightGreyColor,),),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const [
                                                  Text("30\$", style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 16.0),),
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


                              const SizedBox(height: 20,),
                              const Text(
                                'Additional info',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                              const SizedBox(height: 20,),
                              Card(
                                color: AppColors.whiteColor,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                shadowColor: Colors.white30,
                                elevation: 5.0,
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppImages.netwok_icon),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Network',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors
                                                          .inActiveColorPrimary),
                                                )
                                                , Text(
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
                                          SvgPicture.asset(AppImages.plan_type_icon),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Plan type',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors
                                                          .inActiveColorPrimary),
                                                ), Text(
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
                                          SvgPicture.asset(AppImages.information_icon),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                    textDirection: TextDirection.ltr,
                                                    style: const TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors.blackColor),
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
                            PaymentBottomSheet.showSlideDialog(
                              context: context,
                              pillColor: Colors.white,
                              backgroundColor: Colors.white,
                              transitionDuration: const Duration(milliseconds: 300),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: screenSize.width,
                                    height: screenSize.height * .07,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 0.0, left: 18.0, right: 18.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Pay with Vipps', style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),),
                                          GestureDetector(
                                            onTap: () {
                                              moveBack(context);
                                            },
                                            child: Card(
                                              color: AppColors.whiteColor,
                                              elevation: 5.0,
                                              shadowColor: AppColors.lightGreyColor,
                                              shape: const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.white, width: 1),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(45))),
                                              child: Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: SvgPicture.asset(
                                                      AppImages.cross_icon)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: screenSize.width,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: value,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  this.value = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                                width: screenSize.width * .8,
                                                child: Text(Utils.terms_and_condition))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: value,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                this.value = value!;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                              width: screenSize.width * .8,
                                              child: Text(Utils.terms_and_condition1))
                                        ],
                                      )
                                    ],),
                                  const SizedBox(height: 20.0,),
                                  Container(
                                    color: AppColors.transparentColor,
                                    width: screenSize.width,
                                    height: screenSize.height * .06,
                                    child: GestureDetector(
                                      onTap: _isLoading ? null :  () {
                                        // openVippsApp(context);
                                        setState(() => _isLoading = true);
                                        callForCreateOrder(context, controller, widget.model);
                                      },
                                      child: Card(
                                        color: AppColors.activeColorPrimary,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        elevation: 5.0,
                                        shadowColor: Colors.white30,
                                        shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(45))),
                                        child: Center(child: _isLoading ?
                                        const Text(
                                          'creating order...',
                                          style: TextStyle(color: Colors.white),)
                                        :
                                        const Text(
                                          '\$ 20.00 - Pay with vipps',
                                          style: TextStyle(color: Colors.white),) ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Card(
                            color: AppColors.activeColorPrimary,
                            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            elevation: 5.0,
                            shadowColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(45))),
                            child: Center(child: Text(
                              '\$ 20.00 - Pay', style: TextStyle(color: Colors.white),)),
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

  Future<void> callForCreateOrder(BuildContext context, PlanDetailsController controller, PlanDetail model) async {
    if(model != null){
      CreateOrderRequest request = CreateOrderRequest();
      request.quantity = 1;
      request.packageId = model.id.toString();
      request.planDetail = model;

      controller.createOrderRequest(request);
    }
  }

  void openPlanDetails(BuildContext context, int index) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage(),
      ),
    );
  }
}
