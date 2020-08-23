import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';

class AllNewsPage extends StatefulWidget {

  @override
  _AllNewsPageState createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {

  NewsByCategoryBloc _bloc;
  ScrollController _scrollController;

  void _onScroll() {
    final int _scrollThreshold = 200;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchNewsByCategoryEvent(termId: '2743', newsCount: 10));
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<NewsByCategoryBloc>(context);
    _bloc.add(FetchNewsByCategoryEvent(termId: '2743', newsCount: 20));
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsByCategoryBloc, NewsByCategoryState>(
      builder: (context, state) {
        if (state is NewsByCategoryInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsByCategoryErrorState) {
          return Center(
            child: Text("Could not reach server"),
          );
        }
        else if (state is NewsByCategoryLoadedState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return index >= state.newsByCategories[0].items.length
                    ? BottomLoader()
                    : ListTile(title: Text(state.newsByCategories[0].items[index].title),);
              },
              itemCount: state.newsByCategories[0].items.length + 1,
            controller: _scrollController,
          );
        }
        return Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: CircularProgressIndicator()
            )
        );
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
