import 'package:flutter/material.dart';
import 'package:ntv_mock/pages/home_page.dart';
import 'package:ntv_mock/pages/live_tv_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HomePage(),

      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
//          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
        centerTitle: true,
        leading: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.live_tv), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NtvLivePlayerPage()));
            }),
          ],
        ),
        title: Container(
            height: 45,
            child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.fitHeight,)),
      ),
      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
      ),
    );
  }
}