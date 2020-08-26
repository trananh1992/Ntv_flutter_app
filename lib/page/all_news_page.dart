import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';

class AllNewsPage extends StatefulWidget {

  @override
  _AllNewsPageState createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {

  NewsByCategoryBloc _bloc;
  ScrollController _scrollController;
  final int _scrollThreshold = 200;
  int _offset;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchNewsSingleCategoryEvent(termId: '2743', newsCount: 10, offset: _offset));
    }
    print("reached bottom");
  }

  @override
  void initState() {
    super.initState();
    _offset = 0;
    _bloc = BlocProvider.of<NewsByCategoryBloc>(context);
    _bloc.add(FetchNewsSingleCategoryEvent(termId: '2743', newsCount: 20, offset: _offset));
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
        if (state is NewsSingleCategoryLoaded) {
          print("building");
          _offset++;
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.newsSingleCategory.items.length + 1,
              itemBuilder: (context, index) {
                return index >= state.newsSingleCategory.items.length
                    ? BottomLoader()
                    : ListTile(title: Text(state.newsSingleCategory.items[index].title),);
              }
          );
        }
        return Center(child: CircularProgressIndicator());
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
