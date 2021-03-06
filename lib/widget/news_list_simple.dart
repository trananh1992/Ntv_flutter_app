import 'package:flutter/material.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:ntv_mock/model/news_by_category.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/page/news_details.dart';
import 'package:ntv_mock/widget/texts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsList extends StatelessWidget {

  final NewsByCategory newsByCategory;

  NewsList({@required this.newsByCategory});

  static List<Widget> genarateList(List<News> news) {

    List<Widget> widgets = List();

    for(int i = 0 ; i < news.length ; i++) {
      if (i == 0)
        widgets.add(BigThumbnail(news: news[i]));
      else
        widgets.add(NewsTile(news: news[i]));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 5,
        ),
        SizedBox(height: 7),
        NtvTexts.newsSubTitle(newsByCategory.name),
        SizedBox(height: 7),
        Column(
            children: genarateList(newsByCategory.items)
        ),
      ],
    );
  }
}

class BigThumbnail extends StatelessWidget {

  final News news;

  BigThumbnail({@required this.news});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDetailsPage(news: news)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 3, left: 10, right: 10),
        height: screenWidth / 2,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(news.featuredImage.image),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: 40.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    news.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
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




