import 'package:aurora_connect_one/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../commons/app_colors.dart';
// import '../controller/homeController.dart';
// import 'AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _controller = PageController();
  late TabController _tabController;

  final _tabs = [
    const Tab(text: 'Local'),
    const Tab(text: 'Regional'),
    const Tab(text: 'Global'),
  ];

  final controller = Get.put(HomeController());
  bool localDataLoading = true;
  bool globalDataLoading = true;
  bool loading = true;

  @override
  void didChangeDependencies() async {
    await controller.getPackages();
    await controller.getPackageGlobal();
    setState(() {
      localDataLoading = false;
      loading = false;
      globalDataLoading = false;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // var localData = controller.localPlansResponse.value;
    // if (localData != null) {
    //   print('Local data model from home');
    //   print(localData.data?[0].plans.length);
    return Scaffold(
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Container(
              width: width,
              height: height * 0.07,
              decoration: const BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: TextFormField(
                textAlign: TextAlign.left,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16.0, top: 15),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.inActiveColorPrimary,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search country',
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 3,
            left: 4,
          ),
          child: Text(
            "eSIM plans",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.lightBlackColor,
              fontWeight: FontWeight.w600,
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
        localDataLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        )
            : Obx(
              () => Container(
            padding: const EdgeInsets.only(top: 10.0,bottom: 30),
            color: AppColors.backGroundColor,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              onPageChanged: (int pageIndex) {
                _tabController.index = pageIndex;
              },
              controller: _controller, // assign it to PageView
              children: <Widget>[
                controller.loading.value
                    ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const SizedBox(
                            height: 80,
                          ),
                        );
                      },
                    ),
                  ),
                )
                    : loading
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                  ],
                )
                    : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller
                        .model.value.data![0].plans!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // openPlansScreen(
                          //     context,
                          //     localData.data?[0]
                          //         .plans?[index] as LocalPlan);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white, width: 3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15))),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                (controller
                                                    .model
                                                    .value
                                                    .data![0]
                                                    .plans![
                                                index]
                                                    .countryImage!) ??
                                                    ""),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 18.0),
                                      child: SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                                (controller
                                                    .model
                                                    .value
                                                    .data![0]
                                                    .plans![
                                                index]
                                                    .countryName!) ??
                                                    "name not found!",
                                                style: const TextStyle(
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold)),
                                            Text(
                                                '${controller.model.value.data![0].plans![index].totalPlans!} plans',
                                                style: const TextStyle(
                                                    color: Colors
                                                        .grey,
                                                    fontWeight:
                                                    FontWeight
                                                        .normal))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                  AppColors.transparentColor,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors
                                        .activeColorPrimary,
                                    size: 18.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                controller.loading.value
                    ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const SizedBox(
                            height: 80,
                          ),
                        );
                      },
                    ),
                  ),
                )
                    : globalDataLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller
                        .model.value.data![1].plans!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // openPlansScreen(
                          //     context,
                          //     localData.data?[1]
                          //         .plans[index] as LocalPlan);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white, width: 3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15))),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                controller
                                                    .model
                                                    .value
                                                    .data![1]
                                                    .plans![index]
                                                    .countryImage!),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 18.0),
                                      child: SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                                controller
                                                    .model
                                                    .value
                                                    .data![1]
                                                    .plans![index]
                                                    .countryName!,
                                                style: const TextStyle(
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold)),
                                            Text(
                                                '${controller.model.value.data![1].plans![index].totalPlans!} plans',
                                                style: const TextStyle(
                                                    color: Colors
                                                        .grey,
                                                    fontWeight:
                                                    FontWeight
                                                        .normal))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                  AppColors.transparentColor,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors
                                        .activeColorPrimary,
                                    size: 18.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  color: AppColors.backGroundColor,
                  height: height * .552,
                  child: controller.loading.value
                      ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                            child: const SizedBox(
                              height: 80,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                              controller.globalModel.value.data!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    // openPlansDetailsScreen(context);
                                  },
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 0.0),
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
                                                color: Colors.white,
                                                width: 3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
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
                                                      const SizedBox(
                                                          height: 10.0),
                                                      Text(
                                                          controller
                                                              .globalModel
                                                              .value
                                                              .data![index]
                                                              .providerName
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                      const SizedBox(
                                                          height: 2.0),
                                                      Text(
                                                          "${controller.globalModel.value.data![0].countryList!.length.toString()} + Countries"),
                                                      const SizedBox(
                                                          height: 10.0),
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
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                          controller
                                                              .globalModel
                                                              .value
                                                              .data![index]
                                                              .data
                                                              .toString(),
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
                                                              .globalModel
                                                              .value
                                                              .data![index]
                                                              .validity
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                              Colors.grey,
                                                              fontWeight:
                                                              FontWeight
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
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                          "\$ ${controller.globalModel.value.data![index].price}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 18.0,
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
                                      Positioned(
                                          top: 6,
                                          left: 35,
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black38),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10)),
                                              child: Image.network(
                                                controller
                                                    .globalModel
                                                    .value
                                                    .data![index]
                                                    .providerImage
                                                    .toString(),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ))
                                    ]),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ), // page2
              ],
            ),
          ),
        ),
      ]),
    );

    // else {
    //   return Container(
    //     child: Text("Data not found!"),
    //   );
    // }
  }

// openPlansScreen(BuildContext context, LocalPlan model) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => PlansScreen(model: model),
//     ),
//   );
//   // Navigator.pushNamed(context, RoutesName.plans);
// }
//
// // void openPlansDetailsScreen(BuildContext context) {
// //   Navigator.pushNamed(context, RoutesName.plan_details);
// // }
// void openPlansDetailsScreen(BuildContext context) {
//   Navigator.pushNamed(context, RoutesName.plan_details);
//   // Navigator.push(context,
//   //   MaterialPageRoute(builder: (context) => PlanDetailsScreen(model: model),
//   //   ),
//   // );
// }
}

class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  _MaterialDesignPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MaterialDesignPainter(this, onChanged);
  }
}

class _MaterialDesignPainter extends BoxPainter {
  final MaterialDesignIndicator decoration;

  _MaterialDesignPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
      offset.dx,
      configuration.size!.height - decoration.indicatorHeight,
    ) &
    Size(configuration.size!.width, decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
