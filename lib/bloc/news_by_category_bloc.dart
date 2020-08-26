import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';
import 'package:ntv_mock/model/news_by_category.dart';
import 'package:ntv_mock/repository/news_repo.dart';

part 'news_by_category_event.dart';
part 'news_by_category_state.dart';

class NewsByCategoryBloc
    extends Bloc<NewsByCategoryEvent, NewsByCategoryState> {
  final NewsRepository newsRepository;

  NewsByCategoryBloc({@required this.newsRepository})
      : assert(newsRepository != null),
        super(NewsByCategoryInitial());

  @override
  Stream<Transition<NewsByCategoryEvent, NewsByCategoryState>> transformEvents(
      Stream<NewsByCategoryEvent> events, transitionFn) {
    return events
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((transitionFn));
  }

  @override
  Stream<NewsByCategoryState> mapEventToState(
      NewsByCategoryEvent event) async* {

    if (event is FetchNewsByCategoryEvent) {
      yield NewsByCategoryLoading();
      try {
        List<NewsByCategory> newsByCategories = await newsRepository
            .fetchNewsByCategory(event.termId, event.newsCount);
        yield NewsByCategoryLoaded(newsByCategories: newsByCategories);
      } catch (e) {
        yield NewsByCategoryError(errorMessage: e.toString());
      }
    }

    if (event is FetchNewsSingleCategoryEvent) {

      try{

      if (state is NewsSingleCategoryLoaded) {
        NewsByCategory newsSingleCategoryOffset =
        await newsRepository.fetchNewsSingleCategory(
            event.termId, event.newsCount, event.offset);

        newsSingleCategoryOffset.items = (state as NewsSingleCategoryLoaded).newsSingleCategory.items + newsSingleCategoryOffset.items;
        yield NewsSingleCategoryLoaded(newsSingleCategory: newsSingleCategoryOffset);
        return;
      }

      yield NewsByCategoryLoading();
          NewsByCategory newsSingleCategory =
              await newsRepository.fetchNewsSingleCategory(
                  event.termId, event.newsCount, event.offset);
          yield NewsSingleCategoryLoaded(
              newsSingleCategory: newsSingleCategory);
      } catch (e) {
        yield NewsByCategoryError(errorMessage: e.toString());
      }
    }
  }
}
