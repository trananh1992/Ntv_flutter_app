import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_by_category_event.dart';
part 'news_by_category_state.dart';

class NewsByCategoryBloc extends Bloc<NewsByCategoryEvent, NewsByCategoryState> {
  NewsByCategoryBloc() : super(NewsByCategoryInitial());

  @override
  Stream<NewsByCategoryState> mapEventToState(
    NewsByCategoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
