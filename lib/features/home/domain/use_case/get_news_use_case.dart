import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entity/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_repo_interface.dart';

import '../../data/repo/home_repo_imp.dart';

class GetNewsUseCase {
  HomeRepoInterface _repo;
  GetNewsUseCase(this._repo);
  Future<ResultApi<NewsEntity>> invoke() async => await _repo.getNews();
}

GetNewsUseCase  getNewsUseCaseInjectable()=>GetNewsUseCase(homeRepoImpInjectable());
