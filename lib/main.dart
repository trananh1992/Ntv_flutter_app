import 'package:flutter/material.dart';
import 'package:ntv_mock/pages/landing_page.dart';
import 'package:ntv_mock/pages/live_tv_page.dart';
import 'package:ntv_mock/pages/main_page.dart';
import 'package:ntv_mock/ui/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}
