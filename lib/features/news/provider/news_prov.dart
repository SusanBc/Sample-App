import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:omwaynews/features/news/model/news_models.dart';
import 'package:omwaynews/features/news/repository/news_repo.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newsList = [];

  bool isLoading = false;
  getNews({required BuildContext context}) async {
    isLoading = true;
    final newsResponse = await NewsReo.getallNews(context: context);
    newsList = newsResponse;
    isLoading = false;
    notifyListeners();
  }
}
