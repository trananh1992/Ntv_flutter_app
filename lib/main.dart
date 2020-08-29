import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/page/home_page.dart';
import 'package:ntv_mock/page/landing_page.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/repository/news_category_repo.dart';
import 'package:ntv_mock/repository/news_repo.dart';
import 'package:ntv_mock/test/test_page.dart';
import 'package:ntv_mock/ui/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NTV Online",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SolaimanLipi',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(newsRepository: FetchNews()),
          ),
          BlocProvider<NewsCategoryBloc>(
            create: (context) => NewsCategoryBloc(newsCategoryRepository: FetchNewsCategory()),
          ),
          BlocProvider<NewsByCategoryBloc>(
            create: (context) => NewsByCategoryBloc(newsRepository: FetchNews()),
          )
        ],
        child: LandingPage(),
      )
    );
  }
}
