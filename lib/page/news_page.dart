import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_event.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/page/live_tv_page.dart';

class NewsPage extends StatelessWidget {

  NewsCategoryBloc _newsCategoryBloc;

  @override
  Widget build(BuildContext context) {

    _newsCategoryBloc = BlocProvider.of<NewsCategoryBloc>(context);
    _newsCategoryBloc.add(FetchNewsCategoryEvent());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[

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
//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(25),
//          child: Material(
//            color: Colors.white,
//            child: TabBar(
//              isScrollable: true,
//              controller: _tabController,
//              tabs: [
//                Text("সকল", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বাংলাদেশ", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বিশ্ব", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বিনোদন", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("খেলাধুলা", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("রাজনীতি", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("অপরাধ", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("আইন ও বিচার", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("অন্যান্য", style: TextStyle(color: Color(0xFF0e6b39)),),
//              ],
//            ),
//          ),
//        ),
      ),
      body: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
        builder: (context, state) {
          if (state is NewsCategoryLoadedState) {
            return Text(state.newsCategories[0].name);
          }
          return null;
        },
      ),
    );
  }
}

