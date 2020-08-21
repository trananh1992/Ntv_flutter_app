import 'package:flutter/material.dart';
import 'package:ntv_mock/model/news_by_category.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/page/news_details.dart';
import 'package:ntv_mock/widget/texts.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsList {
  static Widget generateListView(NewsByCategory newsByCategory, BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 5,
        ),
        SizedBox(height: 7),
        NtvTexts.newsSubTitle(newsByCategory.name),
        Column(
          children: <Widget>[
            // Big Thumbnail
            Container(
                margin: EdgeInsets.only(top: 3, left: 10, right: 10),
                height: screenWidth / 2,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(newsByCategory.items[0].featuredImage.image),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          newsByCategory.items[0].title,
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
            // List
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsByCategory.items.length - 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDetailsPage(news: newsByCategory.items[index + 1])));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin:
                              EdgeInsets.only(top: 10, bottom: 5, left: 10),
                              height: screenWidth * .3,
                              width: screenWidth * .43,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(newsByCategory.items[index + 1].featuredImage.image),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)))),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              width: screenWidth * .43,
                              child: Text(
                                newsByCategory.items[index + 1].title,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
