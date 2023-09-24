import 'dart:convert';

import 'package:infoguru/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = new List<ArticleModel>.empty(growable: true);

  Future<void> getNews() async {
    String businesssHeadlineUrl =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=33aa13f326a041f8ba5e1c0dc6be8e1e";

    Uri uri = Uri.parse(businesssHeadlineUrl);
    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((article) {
        if (article["urlToImage"] != null && article["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: article["title"],
            author: article["author"],
            content: article["content"],
            desc: article["description"],
            url: article["url"],
            urlToImage: article["urlToImage"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = new List<ArticleModel>.empty(growable: true);

  Future<void> getCategoryNews(String category) async {
    String businesssHeadlineUrl =
        "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=33aa13f326a041f8ba5e1c0dc6be8e1e";

    Uri uri = Uri.parse(businesssHeadlineUrl);
    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((article) {
        if (article["urlToImage"] != null && article["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: article["title"],
            author: article["author"],
            content: article["content"],
            desc: article["description"],
            url: article["url"],
            urlToImage: article["urlToImage"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
