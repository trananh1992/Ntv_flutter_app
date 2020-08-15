part of 'news_bloc.dart';

@immutable
class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  
  final News news;

  NewsLoadedState({@required this.news}) : assert(news != null);

  @override
  List<Object> get props => [news];
}

class NewsErrorState extends NewsState {

  final String errorMessage;

  NewsErrorState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}