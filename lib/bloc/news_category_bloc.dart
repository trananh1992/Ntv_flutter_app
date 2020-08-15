import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/model/news_category.dart';
import 'package:ntv_mock/repository/news_category_repo.dart';

import 'news_category_event.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {

  final NewsCategoryRepository newsCategoryRepository;

  NewsCategoryBloc({@required this.newsCategoryRepository}) : assert(newsCategoryRepository != null), super(null);
  
  NewsCategoryState get initialState => NewsCategoryInitialState();

  @override
  Stream<NewsCategoryState> mapEventToState(NewsCategoryEvent event) async* {
    if (event is FetchNewsCategoryEvent) {
      yield NewsCategoryLoadingState();
      try {
        List<NewsCategory> newsCategories = await newsCategoryRepository.fetchNewsCategory();
        yield NewsCategoryLoadedState(newsCategories: newsCategories);
      } catch (e) {
        yield NewsCategoryErrorState(errorMessage: e.toString());
      }
    }
  }
}