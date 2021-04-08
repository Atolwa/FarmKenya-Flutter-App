import 'package:flutter_app/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/category.dart';
import 'dart:convert';

class API {
  static String baseURL = "https://www.standardmedia.co.ke/farmkenya/api";

  static Future<List<Category>> getCategories() async {
    String categoryURL = "$baseURL/categories";
    try {
      var result = await http.get(Uri.parse(categoryURL));
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body)['categories'];
        List<Category> categories =
            data.map((category) => Category.fromJson(category)).toList();
        return categories;
      } else {
        throw Exception('Could not connect.');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Article>> getArticles(int categoryID) async {
    String articleURL = "$baseURL/category/articles/$categoryID/0/20";
    try {
      var result = await http.get(Uri.parse(articleURL));
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body)['articles'];
        List<Article> articles =
            data.map((article) => Article.fromJson(article)).toList();
        return articles;
      } else {
        throw Exception('Could not connect.');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<Article> getArticle(int article_id) async {
    String articleURL = "$baseURL/article/$article_id";
    try {
      var result = await http.get(Uri.parse(articleURL));
      if (result.statusCode == 200) {
        Map data = jsonDecode(result.body)['article'];
        Article article = Article.fromJson(data);
        article.story = data['story'];
        return article;
      } else {
        throw Exception('Could not connect.');
      }
    } catch (e) {
      throw e;
    }
  }

}
