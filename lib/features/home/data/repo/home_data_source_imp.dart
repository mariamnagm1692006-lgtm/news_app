import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/models/model.dart';
import 'package:news_app/features/home/domain/entity/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source_interface.dart';
@Injectable(as: HomeDataSourceInterface)
class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ResultApi<NewsEntity>> getNews() async {
    try {
      Uri url = Uri.https('newsapi.org', '/v2/everything', {
        'q': 'bitcoin',
        'apiKey': '2cf83d5c7a6a48b897fdb0b8110a171c',
      });

      var response = await http.get(url);
      var responseBody = response.body;
      Map<String, dynamic> json = jsonDecode(responseBody);
      var data = NewsDto.fromJson(json);
      return Success<NewsEntity>(data.toEntity());
    } on SocketException {
      return Error<NewsEntity>('not internet try again');
    } catch (e) {
      return Error<NewsEntity>(e.toString());
    }
  }
}

