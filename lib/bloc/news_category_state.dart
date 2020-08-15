import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ntv_mock/model/news_category.dart';

@immutable
class NewsCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsCategoryInitialState extends NewsCategoryState {}

class NewsCategoryLoadingState extends NewsCategoryState {}

class NewsCategoryErrorState extends NewsCategoryState {

  final String errorMessage;

  NewsCategoryErrorState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];

}

class NewsCategoryLoadedState extends NewsCategoryState {

  final List<NewsCategory> newsCategories;

  NewsCategoryLoadedState({@required this.newsCategories})
      : assert(newsCategories != null);

  @override
  List<Object> get props => [newsCategories];
}

