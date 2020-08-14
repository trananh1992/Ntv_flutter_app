import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search, size: 66, color: Colors.grey[400],),
          SizedBox(height: 10,),
          Text(
            "এখানে সার্চ করুন",
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}
