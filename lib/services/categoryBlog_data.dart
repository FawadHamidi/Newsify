import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsify/models/blogModel.dart';
import 'package:newsify/models/category_model.dart';

class CategoryNews {
  List<BlogModel> news = [];

  Future<void> getCategoryNews(String category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ddcbfd5bf9874e369ecda09b94eb7f98');
    http.Response response = await http.get(url);
    print(response.body);

    var jsonData = await jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          BlogModel blogModel = BlogModel(
            title: element['title'],
            desc: element['description'],
            blogUrl: element['url'],
            imageurl: element['urlToImage'],
            published: element['publishedAt'],
            content: element['content'],
          );
          news.add(blogModel);
        }
      });
    }
  }
}
