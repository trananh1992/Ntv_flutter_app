import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:http/http.dart' as http;

@immutable
abstract class NewsRepository {
  Future<News> fetchNews(String nodeId);
}

class NewsImp implements NewsRepository {

  final String _baseUrl = 'https://www.ntvbd.com/json/node/';

  @override
  Future<News> fetchNews(String nodeId) async {
    var response = await http.get(_baseUrl + nodeId);

    if (response.statusCode != 200)
      throw Exception();

    var jsonData = json.decode(response.body);
    News news = News.fromJson(jsonData);
    return news;
  }
}