import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_event.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/model/news_category.dart';
import 'package:ntv_mock/page/all_news_page.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/repository/news_repo.dart';
import 'package:ntv_mock/widget/news_list_shimmer.dart';
import 'package:ntv_mock/widget/news_list_simple.dart';

class NewsPageByCategory extends StatefulWidget {

  List<Children> childCategories;
  NewsCategory parentCategory;

  NewsPageByCategory({@required this.childCategories, this.parentCategory});

  @override
  _NewsPageByCategoryState createState() => _NewsPageByCategoryState();
}

class _NewsPageByCategoryState extends State<NewsPageByCategory>
    with TickerProviderStateMixin {

  TabController _tabController;
//  NewsByCategoryBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: widget.childCategories.length + 1, vsync: this);
  }

  List<Tab> _tabBarBuilder(List<Children> childCategories, NewsCategory parentCategory) {
    List<Tab> _tabs = List();

    _tabs.add(Tab(text: parentCategory.name));

    childCategories.forEach((child) {
      _tabs.add(Tab(text: child.name));
    });

    return _tabs;
  }

  List<Widget> _tabViewBuilder(List<Children> childCategories) {

    List<Widget> _tabViews = List();

    _tabViews.add(ParentCategoryPage(childCategories: childCategories));

    childCategories.forEach((child) {
      _tabViews.add(AllNewsPage(termId: child.tid));
    });

    return _tabViews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Stack(
          children: <Widget>[
            AppBar(
              elevation: 0,
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
                            labelStyle: TextStyle(
                                fontFamily: 'SolaimanLipi',
                                fontSize: 16), //Color(0xFF0e6b39)
                            isScrollable: true,
                            controller: _tabController,
                            tabs: _tabBarBuilder(widget.childCategories, widget.parentCategory)
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
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                    height: 55,
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabViewBuilder(widget.childCategories)
      ),
    );
  }
}

class ParentCategoryPage extends StatelessWidget {
  List<Children> childCategories;

  ParentCategoryPage({@required this.childCategories});

  NewsByCategoryBloc _bloc;

  String _categories = "";

  @override
  Widget build(BuildContext context) {
    childCategories.forEach((category) {
      _categories = _categories + category.tid.toString() + ",";
    });

    _bloc = BlocProvider.of(context);
    _bloc.add(FetchNewsByCategoryEvent(termId: _categories, newsCount: 5));

    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return BlocBuilder<NewsByCategoryBloc, NewsByCategoryState>(
            builder: (context, state) {
              if (state is NewsByCategoryError) {
                return Center(
                  child: Text("Could not reach server"),
                );
              } else if (state is NewsByCategoryLoaded) {
                return NewsList(newsByCategory: state.newsByCategories[index]);
              }
              return NewsListShimmer();
            },
          );
        });
  }
}
