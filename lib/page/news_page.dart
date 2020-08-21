import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_event.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/repository/news_repo.dart';
import 'package:ntv_mock/widget/news_list_simple.dart';

class NewsPage extends StatelessWidget {

  // 2743 = Bangladesh
  // 745 = World
  // 749 = Sports
  // 2759 = Education

  final String _categories = '2743,2745,2749,2759';
  NewsByCategoryBloc _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of(context);
    _bloc.add(FetchNewsByCategoryEvent(termId: _categories, newsCount: 5));

    return  ListView.builder(
        itemCount: 4,
          itemBuilder: (context, index) {
           return BlocBuilder<NewsByCategoryBloc, NewsByCategoryState>(
             builder: (context, state) {
               if (state is NewsByCategoryErrorState) {
                 return Center(
                   child: Text("Could not reach server"),
                 );
               }
               else if (state is NewsByCategoryLoadedState) {
                 return NewsList.generateListView(state.newsByCategories[index], context);
               }
               return Container(
                 height: MediaQuery.of(context).size.height,
                   child: Center(
                       child: CircularProgressIndicator()
                   )
               );
             },
           );
          }
      );
  }
}

