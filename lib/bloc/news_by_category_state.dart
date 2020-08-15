part of 'news_by_category_bloc.dart';

abstract class NewsByCategoryState extends Equatable {
  const NewsByCategoryState();
}

class NewsByCategoryInitial extends NewsByCategoryState {
  @override
  List<Object> get props => [];
}
