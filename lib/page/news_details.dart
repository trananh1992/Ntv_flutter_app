import 'package:flutter/material.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailsPage extends StatelessWidget {

  final News news;

  NewsDetailsPage({@required this.news}) : assert (news != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[

        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Container(
            height: 45,
            child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.fitHeight,)),
//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(25),
//          child: Material(
//            color: Colors.white,
//            child: TabBar(
//              isScrollable: true,
//              controller: _tabController,
//              tabs: [
//                Text("সকল", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বাংলাদেশ", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বিশ্ব", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("বিনোদন", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("খেলাধুলা", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("রাজনীতি", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("অপরাধ", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("আইন ও বিচার", style: TextStyle(color: Color(0xFF0e6b39)),),
//                Text("অন্যান্য", style: TextStyle(color: Color(0xFF0e6b39)),),
//              ],
//            ),
//          ),
//        ),
      ),
      body: _NewsBody(news: news),
    );
  }
}

class _NewsBody extends StatelessWidget {

  final News news;

  _NewsBody({@required this.news}) : assert (news != null);

  @override
  Widget build(BuildContext context) {

    DateTime _createdTime = DateTime.parse(news.created);
    String _createdTimeString = _createdTime.hour.toString() + ":"
        + _createdTime.minute.toString() + " - "
        + _createdTime.day.toString() + "/"
        + _createdTime.month.toString() + "/"
        + _createdTime.year.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            height: 3,
          ),
          SizedBox(height: 5),
          Text(
              news.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF006699)
            ),
          ),

          SizedBox(height: 5),

          Container(
            color: Colors.grey[200],
            height: 3,
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://www.ntvbd.com/sites/default/files/styles/author_3/public/authors/nijeso-potibedok.jpg?itok=4dykgThO'),
            ),
            title: Text(news.author[0].name),
            subtitle: Text(
              _createdTimeString
            ),
          ),

          Container(
            color: Colors.grey[200],
            height: 3,
          ),

          SizedBox(height: 5),

          Container(
            child: Image.network(news.featuredImage.image),
          ),
          Text(
            news.featuredImage?.caption ?? "" ,
            style: TextStyle(
              fontSize: 12
            ),
          ),

          SizedBox(height: 5),
          Html(data: news.body)
        ],
      ),
    );
  }
}
