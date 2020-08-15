import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:ntv_mock/repository/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository})
      : assert(newsRepository != null), super(NewsInitialState());

  NewsState get initialState => NewsInitialState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoadingState();
      try {
        News news = await newsRepository.fetchNews(event.nodeId);
        yield NewsLoadedState(news: news);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}
