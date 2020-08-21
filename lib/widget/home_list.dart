import 'package:flutter/material.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/widget/texts.dart';

class HomeList {
  static Widget generateListView(
      List<String> imgList, List<String> titles, String header) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 5,
        ),
        SizedBox(height: 10),
        NtvTexts.newsSubTitle(header),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imgList[index]),
                              fit: BoxFit.cover
                            ),
                              borderRadius: BorderRadius.all(Radius.circular(5)))),
                      Flexible(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 180,
                            child: Text(
                              titles[index],
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            )),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

