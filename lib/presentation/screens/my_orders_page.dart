import 'package:aurora_connect_one/domain/my_orders/my_orders_response.dart';
import 'package:aurora_connect_one/presentation/screens/home_page.dart';
import 'package:aurora_connect_one/presentation/screens/my_order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../controllers/my_orders_controller.dart';
import '../widgets/constants.dart';
import 'main_screen.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final controller = Get.put(MyOrdersController());

  @override
  void initState() {
    // TODO: implement initState
    // checkESIMCapability();
    super.initState();
    getData();
  }

  String? userNameString,
      userEmailString,
      userPhoneString,
      userIdString,
      userTokenString;

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      userNameString = prefs.getString(USER_NAME);
      userEmailString = prefs.getString(USER_EMAIL);
      userPhoneString = prefs.getString(USER_PHONE);
      userIdString = prefs.getString(USER_ID);
      userTokenString = prefs.getString(USER_TOKEN);

      print('user information : \n'
          'user id : ${userIdString!} \n'
          'user token : ${userTokenString!} \n');

      await controller.getMyOrders(userIdString!, userTokenString!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Whiln e waiting for data, display a loading spinner or any other loading indicator
          return const Center(
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          // If an error occurred during data fetching, display an error message
          return const Center(child: Text('Error: Something went wrong'));
        } else {
          // If data fetching is successful, build your widget tree using the retrieved data
          // Access the retrieved data through snapshot.data
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("My Orders",style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MainScreen(defaultIndex: 0,)));
              },),
            ),
            body: controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   width: screenSize.width,
                          //   height: screenSize.height * 0.1,
                          //   child: Card(
                          //     elevation: 8,
                          //     shadowColor: Colors.white30,
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           top: 25.0,
                          //           bottom: 2.0,
                          //           left: 24.0,
                          //           right: 24.0),
                          //       child: InkWell(
                          //         onTap: () {
                          //           moveBack(context);
                          //         },
                          //         child: Padding(
                          //           padding: const EdgeInsets.only(
                          //               right: 55.0),
                          //           child: Container(
                          //             padding: const EdgeInsets.all(8.0),
                          //             child: SvgPicture.asset(
                          //               AppImages.back_arrow_icon,
                          //               width: 20,
                          //               height: 20,
                          //               fit: BoxFit.fill,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            color: AppColors.backGroundColor,
                            height: screenSize.height * .87,
                            child: controller.myOrdersResponse.value.data !=
                                    null
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .myOrdersResponse.value.data?.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (controller.myOrdersResponse
                                                  .value.data !=
                                              null) {
                                            openMyOrderDetails(
                                                context,
                                                controller.myOrdersResponse
                                                    .value.data![index]);
                                          } else {}
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0.0),
                                          child: Card(
                                            margin: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 5,
                                                left: 20,
                                                right: 20),
                                            shadowColor: Colors.white30,
                                            elevation: 8.0,
                                            color: Colors.white,
                                            shape:
                                                const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.white,
                                                        width: 3),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.all(10),
                                              padding:
                                                  const EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          controller
                                                                      .myOrdersResponse
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .providerName
                                                                  as String ?? "unknown",
                                                          // 'Marhaba',
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      const SizedBox(
                                                          height: 2.0),
                                                      Text(
                                                          controller
                                                              .myOrdersResponse
                                                              .value
                                                              .data?[index]
                                                              .orderDetail
                                                              ?.id as String,
                                                          // 'ID #677980',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 14.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(getFormattedDate(controller.myOrdersResponse
                                                              .value.data?[index].orderDate as String),
                                                              // '20.02.2022  16:36',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    16.0),
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              controller
                                                                      .myOrdersResponse
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .orderDetail
                                                                      ?.data1
                                                                  as String,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const SizedBox(
                                                              height: 2.0),
                                                          Text(
                                                              '${controller
                                                                      .myOrdersResponse
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .orderDetail
                                                                      ?.validity
                                                                  as String} days',
                                                              // '10 days',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    16.0),
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "${controller.myOrdersResponse.value.data?[index].orderDetail?.price} \$",
                                                              // "20 \$",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                    })
                                : const Center(
                                    child: Text('Error: Data not found')),
                          ),
                        ],
                      )
                    ],
                  ),
          ); // Replace YourWidget with your own widget
        }
      },
    );
  }

  void moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  void openMyOrderDetails(
      BuildContext context, MyOrdersDataResponse ordersDataResponse) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MyOrderDetailsScreen(ordersDataResponse: ordersDataResponse)),
    );
  }

  String getFormattedDate(String orderDate) {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('dd-MM-yyyy kk:mm').format(now);
    print('Formatted date and time: $formattedDateTime'); // Output: Formatted date and time: 2023-06-26 15:30:45

    return formattedDateTime;
  }
}
