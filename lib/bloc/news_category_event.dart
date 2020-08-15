import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewsCategoryEvent extends Equatable {}

class FetchNewsCategoryEvent extends NewsCategoryEvent {
  @override
  List<Object> get props => [];
}