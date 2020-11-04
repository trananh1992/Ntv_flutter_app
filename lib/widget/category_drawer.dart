import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_event.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/page/news_by_category_page.dart';

class CatDrawer extends StatelessWidget {

  NewsCategoryBloc _bloc;

  static var _cat =
      "বাংলাদেশ বিশ্ব খেলাধুলা বিনোদন অর্থনীতি শিক্ষা মত-দ্বিমত শিল্প-ও-সাহিত্য জীবনধারা স্বাস্থ্য বিজ্ঞান-ও-প্রযুক্তি ভ্রমণ ধর্ম-ও-জীবন সহজ ইংরেজি প্রিয় প্রবাসী আইন-কানুন চাকরি-চাই অটোমোবাইল শিশু-কিশোর হাস্যরস নির্বাচন";

  List<String> _cats = _cat.split(" ");

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of(context);
    _bloc.add(FetchNewsCategoryEvent());

    return BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
      builder: (context, state) {
        if (state is NewsCategoryLoadedState) {

          List<Widget> _categoriesListTiles = new List();

          _categoriesListTiles.add(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("ক্যাটাগরি",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400]),
                  )
              )
          );

          state.newsCategories.forEach((category) {
            _categoriesListTiles.add(
                ListTile(
                  leading: Icon(Icons.blur_circular),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsPageByCategory(childCategories: category.children, parentCategory: category,)));
                  },
                  title: Text(category.name),
                )
            );
          });

          return ListView(
            children: _categoriesListTiles,
          );
        }

        return Container();
      }
    );

    return ListView.builder(
        itemCount: _cats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.blur_circular),
            onTap: () {},
            title: Text(_cats[index]),
          );
        });
  }
}