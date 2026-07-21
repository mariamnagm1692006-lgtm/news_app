import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entity/news_entity.dart';

abstract interface class HomeDataSourceInterface {
  Future<ResultApi<NewsEntity>>getNews();
}