import 'package:flutter/material.dart';
import 'package:ntv_mock/page/bookmark_page.dart';
import 'package:ntv_mock/page/home_page.dart';
import 'package:ntv_mock/page/news_page.dart';
import 'package:ntv_mock/page/search_page.dart';
import 'package:ntv_mock/page/settings_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ntv_mock/widget/custom_widgets.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      NewsPage(),
//      SearchPage(),
      BookmarkPage(),
      SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("হোম পেজ"),
        activeColor: Color(0xFF0e6b39),
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
//      PersistentBottomNavBarItem(
//        icon: Icon(Icons.search),
//        title: ("সার্চ করুন"),
//        activeColor: Colors.blue,
//        inactiveColor: Colors.grey,
//        isTranslucent: false,
//      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmark_border),
        title: ("বুকমার্ক"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("সেটিংস"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarCurve: NavBarCurve.upperCorners,
        controller: _controller,
        screens: _buildScreens(),
        items:
        _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        onItemSelected: (int) {
          setState(
                  () {}); // This is required to update the nav bar if Android back button is pressed
        },
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
        itemCount: 4,
        navBarStyle: NavBarStyle.style1 // Choose the nav bar style with this property
    );
  }
}
