import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:omwaynews/features/news/model/news_models.dart';

class NewsReo {
  static Future<List<NewsModel>> getallNews(
      {required BuildContext context}) async {
    List<NewsModel> newsLists = [];
    try {
      final response = await http.get(
          Uri.parse("https://nesog.omwaytechnologies.com/api/newsapi"),
          headers: {"content-Type": "application/json"});
      List<dynamic> jsonResponse = json.decode(response.body);
      for (var d in jsonResponse) {
        if (d is List) {
          // Map each item in the inner list to a NewsModel object
          List<NewsModel> newsList =
              d.map((item) => NewsModel.fromJson(item)).toList();
          // Add the news items to the list of all news
          newsLists.addAll(newsList);
        }
      }
      // Map each item to a NewsModel object

      return newsLists;
    } on HttpException catch (e) {
      rethrow;
    }
  }
}
