import 'dart:convert';

import 'package:newz/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = [];
  
  Future getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=b587526b23a74d2190ebb7170cada56c";
    final uri = Uri.parse(url);

    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){

      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] !=null){
          ArticleModel articleModel = ArticleModel(author: element["author"], 
          title: element["title"], 
          description: element["description"], 
          url: element["url"], 
          urlToImage: element["urlToImage"], 
          content: element["content"],);
          // adding to the List of articles
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{

  List<ArticleModel> news = [];
  
  Future getCategoryNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=b587526b23a74d2190ebb7170cada56c";
    final uri = Uri.parse(url);

    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){

      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] !=null){
          ArticleModel articleModel = ArticleModel(author: element["author"], 
          title: element["title"], 
          description: element["description"], 
          url: element["url"], 
          urlToImage: element["urlToImage"], 
          content: element["content"],);
          // adding to the List of articles
          news.add(articleModel);
        }
      });
    }
  }
}