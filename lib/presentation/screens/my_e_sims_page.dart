import 'package:aurora_connect_one/presentation/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/my_esim_model.dart';
import '../../domain/region_model.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../controllers/plans_details_controller.dart';
import '../custom_views/MaterialDesignIndicator.dart';

class MyE_SimsPage extends StatefulWidget {
  const MyE_SimsPage({Key? key}) : super(key: key);

  @override
  State<MyE_SimsPage> createState() => _MyE_SimsPageState();
}

class _MyE_SimsPageState extends State<MyE_SimsPage>
    with SingleTickerProviderStateMixin {
  final _controller = PageController();
  late TabController _tabController;
  final _tabs = [
    const Tab(text: 'Current'),
    const Tab(text: 'Archived'),
  ];

  static var currentList = [
    MyESimModel('Merhaba', 'Turkey', '4 GB', AppImages.marhaba_icon),
    MyESimModel('Merhaba1', 'Pakistan', '4 GB', AppImages.marhaba_icon),
    MyESimModel('Merhaba1', 'Pakistan', '4 GB', AppImages.marhaba_icon),
  ];
  static var archivedList = [
    Region('Africa', AppImages.region_africa_icon, '4'),
    Region('Asia', AppImages.region_asia_icon, '4'),
    Region('Caribbean Island', AppImages.region_carribean_icon, '4'),
    Region('Europe', AppImages.region_africa_icon, '4'),
    Region('Latin america', AppImages.region_latin_america_icon, '4'),
    Region('Middle East & North Africa',
        AppImages.region_middle_east_africa_icon, '4'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body:  ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 12.w,
              left: 8.w,
            ),
            child: const Text(
              "My eSIM",
              style: TextStyle(
                fontSize: 25,
                color: AppColors.lightBlackColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TabBar(
              onTap: (int index) {
                setState(() {
                  _controller.animateToPage(index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut);
                });
              },
              controller: _tabController,
              labelColor: AppColors.activeColorPrimary,
              unselectedLabelColor: AppColors.inActiveColorPrimary,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const MaterialDesignIndicator(
                  indicatorHeight: 4,
                  indicatorColor: AppColors.activeColorPrimary),
              tabs: _tabs,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            color: AppColors.backGroundColor,
            height: height * .65,
            child: PageView(
              controller: _controller, // assign it to PageView
              children: <Widget>[
                currentList.length == 5
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 14.0),
                            child: Stack(children: [
                              Card(
                                margin: const EdgeInsets.only(
                                    top: 35, bottom: 5, left: 10, right: 10),
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.white, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  '',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(height: 2.0),
                                              Text(currentList[0].country,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0),
                                            child: SizedBox(
                                              height: 45.0,
                                              width: 1.0,
                                              child: Container(
                                                width: 1.0,
                                                color: AppColors.lightGreyColor,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(currentList[index].remaining,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold)),
                                              const SizedBox(height: 2.0),
                                              const Text('Remaining',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 12.0, right: 12.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 35.0,
                                              width: 120.0,
                                              decoration: const BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(80.0))),
                                              child: const Center(
                                                  child: Text('Top up',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                openDetails(context);
                                              },
                                              child: Container(
                                                height: 35.0,
                                                width: 120.0,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors.mainColor,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(80.0),
                                                    )),
                                                child: const Center(
                                                    child: Text('Details',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .mainColor,
                                                            fontWeight: FontWeight
                                                                .normal))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  left: 20,
                                  child: Image.asset(AppImages.marhaba_icon))
                            ]),
                          );
                        })
                    : Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          SvgPicture.asset(
                            AppImages.empty_data_icon,
                            width: width * 0.5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "No Current ESim found!",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                archivedList.length >= 10
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: archivedList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          archivedList[index].imagePath,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(archivedList[index].name,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  '${archivedList[index].numberOfPlans} plans',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.transparentColor,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.activeColorPrimary,
                                      size: 18.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          SvgPicture.asset(
                            AppImages.empty_data_icon,
                            width: width * 0.55,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "No archived SIMs found!",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {},
                            child: Container(
                              height: 35.0,
                              width: 120.0,
                              decoration: const BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0))),
                              child: const Center(
                                  child: Text('Browse plans',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal))),
                            ),
                          ),
                        ],
                      ), // page2
              ],
            ),
          ),
        ],
      ),
    );
  }

  openDetails(BuildContext context) {
    print('open details is called');
    Navigator.pushNamed(context, RoutesName.my_esim_details);
  }
}
