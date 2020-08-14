import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.bookmark_border, size: 66, color: Colors.grey[400],),
            SizedBox(height: 10,),
            Text(
              "এখানে বুকমার্ক করা ভিডিও\nদেখতে পাবেন",
              textAlign: TextAlign.center,
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
