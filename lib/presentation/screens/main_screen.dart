import 'package:aurora_connect_one/presentation/screens/profile_page.dart';
import 'package:flutter/material.dart';
import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../widgets/main_bottom_bar.dart';
import 'home_page.dart';
import 'my_e_sims_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  int _currentIndex = 0;
  final _inactiveColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MyE_SimsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        resizeToAvoidBottomInset: false,
        drawer: const Drawer(),
        body: _widgetOptions.elementAt(_currentIndex),
          bottomNavigationBar: _buildBottomBar()
      ),
    );
  }

  Widget _buildBottomBar(){
    return MainBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: AppImages.home_filled_icon,
          title: const Text('Home'),
          activeColor: AppColors.activeColorPrimary,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: AppImages.my_esim_filled_icon,
          title: const Text('My eSIM'),
          activeColor: AppColors.activeColorPrimary,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: AppImages.my_profile_filled_icon,
          title: const Text('Profile',),
          activeColor: AppColors.activeColorPrimary,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
