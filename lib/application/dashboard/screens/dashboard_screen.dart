import 'package:beauty_center/application/dashboard/widgets/app_bar_widget.dart';
import 'package:beauty_center/application/dashboard/widgets/bottom_navigation_bar_Item_active_icon_widget.dart';
import 'package:beauty_center/application/dashboard/widgets/bottom_navigation_bar_Item_icon_widget.dart';
import 'package:beauty_center/application/dashboard/widgets/bottom_navigation_bar_widget.dart';
import 'package:beauty_center/application/home/screens/home_screen.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:beauty_center/core/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Map navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  int currentIndex = 0;

  List<String> tabsTitles = [];

  @override
  void initState() {
    tabsTitles = [
      "Profile",
      "Favorite",
      "Home",
      "Payment",
      "Search",
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        var bool = await navigatorKeys[currentIndex]!.currentState!.maybePop();
        if (bool == false) {
          if (currentIndex == 0) {
          } else {
            setState(() {
              currentIndex = 0;
              // currentTab = tabs[0];
            });
          }
        }
      },
      child: Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.white,
          appBar: AppBarWidget(
            isDashboard: true,
            actions: const [],
            title: tabsTitles[currentIndex],
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            items: const [
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    assetName: IconPath.profileIcon,
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    assetName: IconPath.profileIcon,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    assetName: IconPath.loveIcon,
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    assetName: IconPath.loveIcon,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    assetName: IconPath.homeIcon,
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    assetName: IconPath.activeHomeIcon,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    assetName: IconPath.paymentIcon,
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    assetName: IconPath.paymentIcon,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    assetName: IconPath.searchIcon,
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    assetName: IconPath.searchIcon,
                  ),
                  label: ''),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
                // currentTab = tabs[index];
              });
            },
            currentIndex: currentIndex,
          ),
          body: NavigatorWidget(
            navigatorKey: navigatorKeys[currentIndex],
            widget: buildBody(currentIndex),
          )),
    );
  }

  Widget buildBody(int index) {
    if (index == 2) {
      return const HomeScreen();
    } else {
      return Container(color: Colors.white);
    }
  }
}
