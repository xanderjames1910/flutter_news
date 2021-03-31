import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/utils/utils.dart';

final _URL_NEWS = 'https://newsapi.org/v2';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    // print('Cargando Headlines');

    final url = '$_URL_NEWS/top-headlines?apiKey=$NEWS_API_KEY&country=us';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
