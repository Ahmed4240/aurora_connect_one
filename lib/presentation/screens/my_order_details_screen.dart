import 'package:aurora_connect_one/domain/my_orders/my_orders_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/plans/PlanDetail.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';

class MyOrderDetailsScreen extends StatefulWidget {
  const MyOrderDetailsScreen({super.key, required this.ordersDataResponse});

  final MyOrdersDataResponse ordersDataResponse;

  @override
  State<MyOrderDetailsScreen> createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  var loadingPercentage = 0;

  String getCoverage(PlanDetail? model) {
    String countries = "";
    if (model?.countryList != null) {
      int? length = 0;
      length = model?.countryList!.length;
      if (length! > 1) {
        countries = "${model?.countryList!.length} countries";
      } else {
        countries = model?.countryList![0]?.countryName as String;
      }
    }

    return countries;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
                      onTap: () {
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
                      child: Center(
                        child: Text(
                          'ID #${widget.ordersDataResponse.orderId}',
                          style: const TextStyle(
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
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Text(
                    widget.ordersDataResponse.orderDate as String,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: AppColors.inActiveColorPrimary),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: SizedBox(
              height: screenSize.height * .783,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
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
                            'Plan',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            widget.ordersDataResponse.orderDetail?.providerName
                                as String,
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
                            'Coverage',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            getCoverage(widget.ordersDataResponse.orderDetail)
                                .toString(),
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
                            widget.ordersDataResponse.orderDetail?.data1
                                as String,
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
                            widget.ordersDataResponse.orderDetail?.data1
                                as String,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: AppColors.whiteColor,
                    elevation: 2.0,
                    shadowColor: Colors.white10,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Aurora Connect',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Org no. 689905450',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.inActiveColorPrimary),
                                  ),
                                ],
                              ),
                              const Text(
                                'Receipt #36654',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                '\$10.00 (NOK 112)',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Discount',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                '15%',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Charged amount',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                '\$ 8.5 (NOK 95)',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Payment method',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                'Vipps',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.inActiveColorPrimary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    color: AppColors.whiteColor,
                    elevation: 2.0,
                    shadowColor: Colors.white10,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                '\$8.5 (NOK 95)',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  moveBack(BuildContext context) {
    Navigator.pop(context);
  }
}
