import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:insights_news/core/constsnts/constants.dart';
import 'package:insights_news/features/model/news_model/news_model.dart';

class ApiServices {
  static Future<NewsModel?> getNewsByCategory(String category) async {
       // https://newsapi.org/v2/top-headlines?country=us&apiKey=93e87aa99c6e4886b45cbf93165689ef
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?country=us&category=$category&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
      //  print("Done");
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
    
    // by search 
      static Future<NewsModel?> getNewsBySearch(String query) async {
    try {
     
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?q=$query&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
//
 static Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?sources=$source&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }


//
    static Future <NewsModel?> getArticlesBySources(String sourceId) async {
    try {
      var url = Uri.parse(
      
          '${ApiConstants.baseUrl+ApiConstants.topHeadLines}?sources=$sourceId&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if(res.statusCode == 200){
          NewsModel model = NewsModel.fromJson(json.decode(res.body));
     
          return model ;
      }
    } catch (e) {
      log(e.toString());
    }
    return null ;
  }
// img by category
static Future<NewsModel?> getNewsByCategoryImageGeneral() async {
    try {
     
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?category=general&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }





}





 