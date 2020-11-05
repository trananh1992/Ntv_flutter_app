part of 'news_by_category_bloc.dart';

@immutable
abstract class NewsByCategoryEvent extends Equatable {}

class FetchNewsByCategoryEvent extends NewsByCategoryEvent {

  final String termId;
  final int newsCount;

  FetchNewsByCategoryEvent({@required this.termId, this.newsCount}) : assert(termId != null);

  @override
  List<Object> get props => [];
}

class FetchNewsSingleCategoryEvent extends NewsByCategoryEvent {

  final String termId;
  final int newsCount;
  final int offset;
  final bool reset;

  FetchNewsSingleCategoryEvent({@required this.termId, this.newsCount, this.offset, this.reset}) : assert(termId != null);

  @override
  List<Object> get props => [];
}

class ResetNewsByCategoryEvent extends NewsByCategoryEvent {
  @override
  List<Object> get props => [];
}
