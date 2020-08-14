import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ntv_mock/model/news_category.dart';

abstract class NewsCategoryRepository {
  Future<List<NewsCategory>> getNewsCategory();
}

class NewsCategoryImp implements NewsCategoryRepository {

  String url = 'https://www.ntvbd.com/json/category/news/list';

  Future<List<NewsCategory>> getNewsCategory() async {
    var response = await http.get(url);

    if (response.statusCode != 200)
      throw Exception();

    var jsonData = json.decode(response.body);
//    List<NewsCategory> newsCategories = List<NewsCategory>.from(jsonData).map((Map model) => NewsCategory.fromJson(jsonData)).toList();
    List<NewsCategory> newsCategories = (jsonData as List).map((i) => NewsCategory.fromJson(i)).toList();
    return newsCategories;
  }
}