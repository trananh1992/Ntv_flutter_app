part of 'news_by_category_bloc.dart';

class NewsByCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsByCategoryInitialState extends NewsByCategoryState {}

class NewsByCategoryLoadingState extends NewsByCategoryState {}

class NewsByCategoryLoadedState extends NewsByCategoryState {

  final List<NewsByCategory> newsByCategories;

  NewsByCategoryLoadedState({@required this.newsByCategories}) : assert(newsByCategories != null);

  @override
  List<Object> get props => [newsByCategories];
}
class NewsByCategoryErrorState extends NewsByCategoryState {

  final String errorMessage;

  NewsByCategoryErrorState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
