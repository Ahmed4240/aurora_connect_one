import 'package:aurora_connect_one/domain/plans/PlansInCountryResponse.dart';
import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:aurora_connect_one/presentation/screens/plan_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../../domain/plans/PlanDetail.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../controllers/plans_controller.dart';

class PlansScreen extends StatelessWidget {

  const PlansScreen({super.key, required this.model});

  final LocalPlan model;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return GetX<PlansController>(
        init: PlansController(model),
        builder: (controller) {
          return SafeArea(
            child: controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Container(
                  height: screenSize.height * .41,
                  color: AppColors.activeColorPrimary,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 44.0, left: 18.0, right: 18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  moveBack(context);
                                },
                                child: const Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white,)),
                            Text(model.countryName ?? "Unknown",
                              style: const TextStyle(color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis'),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(80.0),
                                image: DecorationImage(
                                    image: NetworkImage(model.countryImage), fit: BoxFit.fill),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width,
                        height: screenSize.height * .4,
                        child: Column(children: [
                          const SizedBox(height: 50,),
                          SizedBox(
                            width: screenSize.width,
                            height: screenSize.height * .33,
                            child: SvgPicture.asset(
                                AppImages.plans_top_bg, fit: BoxFit.fill),
                          ),
                        ],),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenSize.height * .05,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Text('Choose data plan', style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      color: AppColors.backGroundColor,
                      height: screenSize.height * .525,

                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.localPlansResponse.data?.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                openPlanDetails(context, controller.localPlansResponse
                                    .data?[index] as PlanDetail);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Stack(children: [
                                  Card(
                                    margin: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 5,
                                        left: 20,
                                        right: 20),
                                    shadowColor: Colors.white30,
                                    elevation: 8.0,
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 3),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10.0),
                                                  Text((controller.localPlansResponse
                                                      .data?[index]
                                                      .providerName as String) ??
                                                      "unknown",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .bold)),
                                                  const SizedBox(height: 2.0),
                                                  Text(controller.localPlansResponse
                                                      .data?[index]
                                                      .slug as String,
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  const SizedBox(height: 10.0),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 24.0),
                                                child: SizedBox(
                                                  height: 45.0,
                                                  width: 1.0,
                                                  child: Container(
                                                    width: 1.0,
                                                    color: AppColors
                                                        .lightGreyColor,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(controller.localPlansResponse
                                                      .data?[index]
                                                      .data as String,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .bold)),
                                                  const SizedBox(height: 2.0),
                                                  Text(controller.localPlansResponse
                                                      .data?[index]
                                                      .validity as String,
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 24.0),
                                                child: SizedBox(
                                                  height: 45.0,
                                                  width: 1.0,
                                                  child: Container(
                                                    width: 1.0,
                                                    color: AppColors
                                                        .lightGreyColor,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${controller.localPlansResponse
                                                          .data?[index]
                                                          .price} \$",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontWeight: FontWeight
                                                              .bold)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 6,
                                      left: 35,
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(
                                              12.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  (controller
                                                      .localPlansResponse
                                                      .data?[index]
                                                      .providerImage
                                                  as String)),
                                              fit: BoxFit.fill),
                                        ),
                                      ))
                                ]),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  void openPlanDetails(BuildContext context, PlanDetail model) {
    // Navigator.pushNamed(context, RoutesName.plan_details);
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => PlanDetailsScreen(model: model),
      ),
    );
  }
}
