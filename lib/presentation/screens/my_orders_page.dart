import 'package:aurora_connect_one/presentation/screens/my_order_details_screen.dart';
import 'package:aurora_connect_one/presentation/screens/plan_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../application/services/secure_storage.dart';
import '../../domain/plans/PlanDetail.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../controllers/my_orders_controller.dart';
import '../widgets/constants.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final controller = Get.put(MyOrdersController());

  final SecureStorage localDb = SecureStorage();


  @override
  void didChangeDependencies() async {
    if(flutterSecureClientUserId != null && flutterSecureClientToken != null){
      await controller.getMyOrders(flutterSecureClientUserId!, flutterSecureClientToken!);
    }
    setState(() {});
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    // checkESIMCapability();
    super.initState();
    getData();
  }
  void getData() async {
    await localDb.readSecureData('requestUserName')
        .then((value) => {flutterSecureLoginUserName = value});
    await localDb.readSecureData('requestUserId')
        .then((value) => {flutterSecureClientUserId = value});
    await localDb.readSecureData('requestUserToken')
        .then((value) => {flutterSecureClientToken = value});
    print('order requestUserName : $flutterSecureLoginUserName');
    print('order requestUserId : $flutterSecureClientUserId');
    print('order requestUserToken : $flutterSecureClientToken');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return SafeArea(
      child: controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  moveBack(context);
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
                                      'My orders',
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
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      color: AppColors.backGroundColor,
                      height: screenSize.height * .87,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              // controller.myOrdersResponse.value.data?.length,
                              10,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                openMyOrderDetails(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Card(
                                  margin: const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
                                  shadowColor: Colors.white30,
                                  elevation: 8.0,
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                                // (controller.myOrdersResponse.value.data?[index].providerName as String) ?? "unknown",
                                                'Marhaba',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 2.0),
                                            Text(
                                                // controller.myOrdersResponse.value.data?[index].orderDetail?.slug as String,
                                                'ID #677980',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                        const SizedBox(height: 14.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                    // controller.myOrdersResponse.value.data?[index].orderDetail?.slug as String,
                                                    '20.02.2022  16:36',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: SizedBox(
                                                height: 45.0,
                                                width: 1.0,
                                                child: Container(
                                                  width: 1.0,
                                                  color:
                                                      AppColors.lightGreyColor,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                // Text(controller.myOrdersResponse.value.data?[index].orderDetail?.data1
                                                Text('7 GB',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(height: 2.0),
                                                Text(
                                                    // controller.myOrdersResponse.value.data?[index].orderDetail?.validity
                                                    '10 days',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: SizedBox(
                                                height: 45.0,
                                                width: 1.0,
                                                child: Container(
                                                  width: 1.0,
                                                  color:
                                                      AppColors.lightGreyColor,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                    // "${controller.myOrdersResponse.value.data?[index].orderDetail?.price} \$",
                                                    "20 \$",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
    );
  }

  void moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  void openMyOrderDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyOrderDetailsScreen(),
      ),
    );
  }
}
