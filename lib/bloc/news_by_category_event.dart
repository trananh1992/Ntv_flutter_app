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
