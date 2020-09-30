import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeContentColor == null
                      ? item.activeColor
                      : item.activeContentColor)
                      : item.inactiveColor == null
                      ? item.activeColor
                      : item.inactiveColor),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeContentColor == null
                            ? item.activeColor
                            : item.activeContentColor)
                            : item.inactiveColor,
                        fontWeight: FontWeight.w400,
                        fontSize: item.titleFontSize),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {

  TabController tabController;

  CustomAppBar({@required tabController});

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Stack(
        children: <Widget>[
          AppBar(
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 0),
                  icon: Icon(Icons.live_tv),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NtvLivePlayerPage()));
                  }),
              IconButton(
                  padding: EdgeInsets.only(right: 10),
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ],
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Material(
                color: Colors.white,
                child: Container(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                      ),
                      Flexible(
                        child: TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontFamily: 'SolaimanLipi', fontSize: 16), //Color(0xFF0e6b39)
//                    unselectedLabelStyle: TextStyle(color: Colors.black, fontFamily: 'SolaimanLipi',),
                          isScrollable: true,
                          controller: tabController,
                          tabs: [
                            Tab(text: "সকল"),
                            Tab(text: "খবর"),
                            Tab(text: "ফিচার"),
                            Tab(text: "ছবি"),
                            Tab(text: "ভিডিও"),
                            Tab(text: "নাটক"),
                            Tab(text: "সিনেমা"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 15,
            child: Container(
                height: 55,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.fitHeight,
                )),
          ),
        ],
      ),
    );
  }
}
