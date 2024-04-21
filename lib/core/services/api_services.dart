import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:insights_news/core/constants/constants.dart';
import 'package:insights_news/features/model/news_model/news_model.dart';

class ApiServices {

  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
    
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?country=us&category=$category&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch(e){
      log(e.toString());
    }
    return null;
  }
}