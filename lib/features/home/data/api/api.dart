import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/result_api.dart';

import '../models/model.dart';

abstract class Api {
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2cf83d5c7a6a48b897fdb0b8110a171c
  static Future<ResultApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https('newsapi.org', '/v2/everything', {
        'q': 'bitcoin',
        'apiKey': '2cf83d5c7a6a48b897fdb0b8110a171c',
      });

      var response = await http.get(url);
      var responseBody = response.body;
      Map<String, dynamic> json = jsonDecode(responseBody);
      var data = NewsModel.fromJson(json);
      return Success<NewsModel>(data);
    } catch (e) {
      return Error<NewsModel>(e.toString());
    }
  }
}
