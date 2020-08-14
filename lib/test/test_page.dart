import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  NewsCategoryBloc newsCategoryBloc;

  @override
  void initState() {
    super.initState();
    newsCategoryBloc = BlocProvider.of<NewsCategoryBloc>(context);
    newsCategoryBloc.add(FetchNewsCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
        builder: (context, state) {
          if (state is NewsCategoryLoadedState) {
            return ListView.builder(
              itemCount: state.newsCategories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("" + state.newsCategories[index].name),
                  );
                }
            );
          }
          else if (state is NewsCategoryLoadingState)
            return CircularProgressIndicator();
          else if (state is NewsCategoryInitialState)
            return CircularProgressIndicator();
          else if (state is NewsCategoryErrorState)
            return Text(state.errorMessage);

          return Text('Bloc not working');
        },
      ),
    );
  }
}


//class TestHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//
//    )
//  }
//}
