import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ntv_mock/model/news_by_category.dart';
import 'package:ntv_mock/repository/news_repo.dart';

part 'news_by_category_event.dart';
part 'news_by_category_state.dart';

class NewsByCategoryBloc extends Bloc<NewsByCategoryEvent, NewsByCategoryState> {

  final NewsRepository newsRepository;

  NewsByCategoryBloc({@required this.newsRepository})
      : assert(newsRepository != null), super(NewsByCategoryInitialState());




  @override
  Stream<NewsByCategoryState> mapEventToState(NewsByCategoryEvent event) async* {
    if (event is FetchNewsByCategoryEvent) {
      yield NewsByCategoryLoadingState();
      try {
        List<NewsByCategory> newsByCategories = await newsRepository.fetchNewsByCategory(event.termId, event.newsCount);
        yield NewsByCategoryLoadedState(newsByCategories: newsByCategories);
      } catch (e) {
        yield NewsByCategoryErrorState(errorMessage: e.toString());
      }
    }
  }
}
