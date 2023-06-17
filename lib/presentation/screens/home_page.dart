import 'package:aurora_connect_one/domain/plans/PlanDetail.dart';
import 'package:aurora_connect_one/presentation/controllers/home_controller.dart';
import 'package:aurora_connect_one/presentation/screens/plan_details_screen.dart';
import 'package:aurora_connect_one/presentation/screens/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/packages/local/LocalPlansResponse.dart';
import '../commons/app_colors.dart';

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
  bool regionalDataLoading = true;

  @override
  void didChangeDependencies() async {
    await controller.getPackages();
    await controller.getPackageGlobal();
    setState(() {
      localDataLoading = false;
      regionalDataLoading = false;
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
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        Padding(
          padding: const EdgeInsets.only(top: 28, left: 8, right: 8),
          child: Container(
            width: width,
            height: height * 0.07,
            decoration: const BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: TextFormField(
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, top: 15),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.inActiveColorPrimary,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: const BorderSide(color: AppColors.lightGreyColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: const BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                ),
                hintText: 'Search country',
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20,),
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
        Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 30),
          color: AppColors.backGroundColor,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: PageView(
            onPageChanged: (int pageIndex) {
              _tabController.index = pageIndex;
            },
            controller: _controller, // assign it to PageView
            children: [

              ///Local List Screen
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                color: AppColors.backGroundColor,
                child: localDataLoading
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                  ],
                )
                    : Obx(
                      () =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .model.value.data![0].plans!.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 10),
                                      shadowColor: Colors.transparent,
                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: ListTile(
                                        onTap: () {
                                          openPlansScreen(context,
                                              controller.model.value.data?[0]
                                                  .plans?[index] as Plan);
                                        },
                                        leading: CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                              controller
                                                  .model
                                                  .value
                                                  .data![0]
                                                  .plans![index]
                                                  .countryImage!,
                                            )),
                                        title: Text(controller
                                            .model
                                            .value
                                            .data![0]
                                            .plans![index]
                                            .countryName!),
                                        subtitle: Text(
                                            "${controller.model.value.data![0]
                                                .plans![index]
                                                .totalPlans!} Plans"),
                                        trailing: const Icon(
                                            Icons.arrow_forward_ios),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                ),
              ),

              ///Regional List Screen
              regionalDataLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Obx(
                    () =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller
                                  .model.value.data![1].plans!.length,
                              itemBuilder: (BuildContext ctx, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 10),
                                    shadowColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: ListTile(
                                      onTap: () {
                                        openPlansScreen(context,
                                            controller.model.value.data?[1]
                                                .plans?[index] as Plan);
                                      },
                                      leading: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                            controller.model.value.data![1]
                                                .plans![index].countryImage!,
                                          )),
                                      title: Text(controller
                                          .model
                                          .value
                                          .data![1]
                                          .plans![index]
                                          .countryName!),
                                      subtitle: Text(
                                          "${controller.model.value.data![1]
                                              .plans![index]
                                              .totalPlans!} Plans"),
                                      trailing:
                                      const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
              ),

              ///Global List Screen
              globalDataLoading ? const Center(
                  child: CircularProgressIndicator()) : Obx(() =>
                  Column(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.711,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.globalModel.value.data!
                                .length ?? 0,
                            scrollDirection: Axis.vertical,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  openPlansDetailsScreen(context, controller.globalModel.value.data![index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0.0),
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
                                                            .data![
                                                        index]
                                                            .providerName
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    const SizedBox(
                                                        height: 4.0),
                                                    Text(
                                                        "${controller
                                                            .globalModel.value
                                                            .data![0]
                                                            .countryList!
                                                            .length
                                                            .toString()}  Countries",
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .grey,
                                                            fontWeight:
                                                            FontWeight
                                                                .normal)),
                                                    const SizedBox(
                                                        height: 10.0),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      24.0),
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
                                                            .data1.toString(),
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    const SizedBox(
                                                        height: 4.0),
                                                    Text(
                                                        controller
                                                            .globalModel
                                                            .value
                                                            .data![
                                                        index]
                                                            .validity
                                                            .toString(),
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
                                                      24.0),
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
                                                        "\$ ${controller
                                                            .globalModel.value
                                                            .data![index]
                                                            .price}",
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
                                    Positioned(
                                        top: 6,
                                        left: 35,
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                    Colors.black38),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(10)),
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
                      )
                    ],
                  ),
              ),
            ],
          ),
        ),
        // ),
      ]),
    );

    // else {
    //   return Container(
    //     child: Text("Data not found!"),
    //   );
    // }
  }

  void openPlansScreen(BuildContext context, Plan model) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => PlansScreen(model: model),),);
  }

void openPlansDetailsScreen(BuildContext context, PlanDetail data) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => PlanDetailsScreen(model: data),
    ),
  );
}
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