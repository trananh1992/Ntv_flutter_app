import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntv_mock/bloc/news_bloc.dart';
import 'package:ntv_mock/bloc/news_by_category_bloc.dart';
import 'package:ntv_mock/bloc/news_category_bloc.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shimmer/shimmer.dart';

import 'news_details.dart';

class AllNewsPage extends StatefulWidget {

  @override
  _AllNewsPageState createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {

  NewsByCategoryBloc _bloc;
  ScrollController _scrollController;
  final int _scrollThreshold = 200;
  int _offset = 0;
  int _initialNewsCount = 15;
  int _requestNewsCount = 10;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchNewsSingleCategoryEvent(termId: '2743', newsCount: _initialNewsCount, offset: _offset));
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<NewsByCategoryBloc>(context);
    _bloc.add(FetchNewsSingleCategoryEvent(termId: '2743', newsCount: _requestNewsCount, offset: _offset));
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
          _offset += _requestNewsCount;
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.newsSingleCategory.items.length + 1,
              itemBuilder: (context, index) {
                return index >= state.newsSingleCategory.items.length
                    ? BottomLoader()
                    : NewsTile(news: state.newsSingleCategory.items[index]);
              }
          );
        }
        return ListView.builder(
          itemCount: 20,
            itemBuilder: (context, index) {
              return BottomLoader();
            }
        );
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
                height: screenWidth * .2,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: screenWidth * 0.6,
                      color: Colors.white,
                    ),
                    SizedBox(height: 3,),
                    Container(
                      height: 20,
                      width: screenWidth * 0.4,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {

  final News news;

  NewsTile({@required this.news});

  @override
  Widget build(BuildContext context) {

    DateTime _postTime = DateTime.parse(news.created);
    String _timeAgo = timeago.format(_postTime, locale: 'en');
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsDetailsPage(news: news)));
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin:
                EdgeInsets.only(top: 10, bottom: 5, left: 10),
                height: screenWidth * .2,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(news.featuredImage.image),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          news.title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 3,),
                    Text(_timeAgo, style: TextStyle(color: Colors
                        .grey[500]),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
