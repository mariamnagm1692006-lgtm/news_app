import 'package:injectable/injectable.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entity/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source_interface.dart';
import 'package:news_app/features/home/domain/repo/home_repo_interface.dart';

import 'home_data_source_imp.dart';
@Injectable(as:HomeRepoInterface )
class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface _dataSourceInterface;
  HomeRepoImp(this._dataSourceInterface);
  @override
  Future<ResultApi<NewsEntity>> getNews() async =>
      await _dataSourceInterface.getNews();
}


