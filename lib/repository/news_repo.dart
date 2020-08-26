import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:ntv_mock/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:ntv_mock/model/news_by_category.dart';

@immutable
abstract class NewsRepository {
  Future<News> fetchSingleNews(String nodeId);
  Future<List<NewsByCategory>> fetchNewsByCategory(String termId, int count);
  Future<NewsByCategory> fetchNewsSingleCategory(String termId, int count, int offset);
}

class FetchNews implements NewsRepository {

  @override
  Future<News> fetchSingleNews(String nodeId) async {

    String _baseUrl = 'https://www.ntvbd.com/json/node/';

    var response = await http.get(_baseUrl + nodeId);

    if (response.statusCode != 200)
      throw Exception();

    var jsonData = json.decode(response.body);
    News news = News.fromJson(jsonData);
    return news;
  }

  @override
  Future<List<NewsByCategory>> fetchNewsByCategory(String termId, int count) async {

    String _baseUrl = 'https://www.ntvbd.com/json/category/news/';

    var response = await http.get(_baseUrl + termId + '/' + count.toString());

    if (response.statusCode != 200)
      throw Exception();

    var jsonData = json.decode(response.body);
    List<NewsByCategory> _newsByCategory = (jsonData as List).map((i) => NewsByCategory.fromJson(i)).toList();
    return _newsByCategory;
  }

  @override
  Future<NewsByCategory> fetchNewsSingleCategory(String termId, int count, int offset) async {

    String _baseUrl = 'https://www.ntvbd.com/json/category/news/';

    var response = await http.get(_baseUrl + termId + '/' + count.toString() + '/' + offset.toString());

    if (response.statusCode != 200)
      throw Exception();

    var jsonData = json.decode(response.body);
    List<NewsByCategory> _newsByCategory = (jsonData as List).map((i) => NewsByCategory.fromJson(i)).toList();
    return _newsByCategory[0];
  }
}
