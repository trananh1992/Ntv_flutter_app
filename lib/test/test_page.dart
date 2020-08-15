import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_event.dart';
import 'package:ntv_mock/bloc/news_category_state.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(FetchNewsEvent(nodeId: '779209'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadedState) {
            return Text(state.news.body);
//            return ListView.builder(
//              itemCount: state.newsCategories.length,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    title: Text("" + state.newsCategories[index].name),
//                  );
//                }
//            );
          }
          else if (state is NewsLoadingState)
            return CircularProgressIndicator();
          else if (state is NewsInitialState)
            return CircularProgressIndicator();
          else if (state is NewsErrorState)
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
