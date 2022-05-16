import 'package:exospace_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {

  final String _apiKey = dotenv.env['API_KEY_NEWS'] as String;
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _selectedCategory = 'science';

  bool _isLoading = false;

  List<Article> categoryArticle = [];

  NewsService() {
    getArticleByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  List<Article> get getArticles 
    => categoryArticle;


  Future getArticleByCategory( String category ) async {

    if ( categoryArticle.isNotEmpty ) {
      _isLoading = false;
      notifyListeners();
      return categoryArticle;
    }

    final url = Uri.parse('$_baseUrl/top-headlines?apiKey=$_apiKey&country=us&category=$category');

    final res = await http.get(url);

    final newsResponse = NewsResponse.fromJson(res.body);

    categoryArticle = newsResponse.articles;

    _isLoading = false;

    notifyListeners();
  }

}