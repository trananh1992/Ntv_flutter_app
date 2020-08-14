import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';
import 'package:ntv_mock/model/news_category.dart';
import 'package:ntv_mock/repository/news_category_repo.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  final NewsCategoryRepository newsRepository;

  NewsCategoryBloc({@required this.newsRepository}) : assert(newsRepository != null), super(null);

  @override
  NewsCategoryState get initialState => NewsCategoryInitialState();

  @override
  Stream<NewsCategoryState> mapEventToState(NewsCategoryEvent event) async* {
    if (event is FetchNewsCategoryEvent) {
      yield NewsCategoryLoadingState();
      try {
        List<NewsCategory> newsCategories = await newsRepository.getNewsCategory();
        yield NewsCategoryLoadedState(newsCategories: newsCategories);
      } catch (e) {
        yield NewsCategoryErrorState(errorMessage: e.toString());
      }
    }
  }
}