import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BigThumbnailShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        margin: EdgeInsets.only(top: 3, left: 10, right: 10),
        height: screenWidth / 2,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}

class NewsTileShimmer extends StatelessWidget {
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

class NewsListShimmer extends StatelessWidget {

  static List<Widget> genarateList() {

    List<Widget> widgets = List();

    for(int i = 0 ; i < 5 ; i++) {
      if (i == 0)
        widgets.add(BigThumbnailShimmer());
      else
        widgets.add(NewsTileShimmer());
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 5,
        ),
        SizedBox(height: 7),
        Container(
          color: Colors.white,
          height: 30,
          width: screenWidth * 0.4,
        ),
        SizedBox(height: 7),
        Column(
            children: genarateList()
        ),
      ],
    );
  }
}
