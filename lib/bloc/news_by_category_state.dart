part of 'news_by_category_bloc.dart';

class NewsByCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsByCategoryInitial extends NewsByCategoryState {}

class NewsByCategoryLoading extends NewsByCategoryState {}

class NewsByCategoryLoaded extends NewsByCategoryState {

  final List<NewsByCategory> newsByCategories;

  NewsByCategoryLoaded({@required this.newsByCategories}) : assert(newsByCategories != null);

  @override
  List<Object> get props => [newsByCategories];

  NewsByCategoryLoaded copyWith({List<NewsByCategory> newsByCategories}) {
    return NewsByCategoryLoaded(
        newsByCategories: newsByCategories ?? this.newsByCategories
    );
  }
}

class NewsSingleCategoryLoaded extends NewsByCategoryState {

  final NewsByCategory newsSingleCategory;

  NewsSingleCategoryLoaded({@required this.newsSingleCategory}) : assert(newsSingleCategory != null);

  @override
  List<Object> get props => [newsSingleCategory];

  NewsSingleCategoryLoaded copyWith({NewsByCategory newsSingleCategories}) {
    return NewsSingleCategoryLoaded(
        newsSingleCategory: newsSingleCategories ?? this.newsSingleCategory
    );
  }
}

class NewsByCategoryError extends NewsByCategoryState {

  final String errorMessage;

  NewsByCategoryError({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
