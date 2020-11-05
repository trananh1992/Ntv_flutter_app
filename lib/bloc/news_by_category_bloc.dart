import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntv_mock/model/news.dart';
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
      print('Loading');
      try {
        List<NewsByCategory> newsByCategories = await newsRepository
            .fetchNewsByCategory(event.termId, event.newsCount);
        yield NewsByCategoryLoaded(newsByCategories: newsByCategories);
      } catch (e) {
        yield NewsByCategoryError(errorMessage: e.toString());
      }
    }

    if (event is FetchNewsSingleCategoryEvent) {
      try {

        if (state is NewsSingleCategoryLoaded) {

          if (event.reset) {
            (state as NewsSingleCategoryLoaded).newsSingleCategory.items = [];
          }

          NewsByCategory newsSingleCategoryOffset =
              await newsRepository.fetchNewsSingleCategory(
                  event.termId, event.newsCount, event.offset);

          List<News> mergedItems =
              (state as NewsSingleCategoryLoaded).newsSingleCategory.items +
                  newsSingleCategoryOffset.items;

          newsSingleCategoryOffset.items = mergedItems;

          yield NewsSingleCategoryLoaded(
              newsSingleCategory: newsSingleCategoryOffset);

          return;
        }

        yield NewsByCategoryLoading();
        NewsByCategory newsSingleCategory =
            await newsRepository.fetchNewsSingleCategory(
                event.termId, event.newsCount, event.offset);
        yield NewsSingleCategoryLoaded(newsSingleCategory: newsSingleCategory);
      } catch (e) {
        yield NewsByCategoryError(errorMessage: e.toString());
      }
    }
  }
}
