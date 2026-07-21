import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entity/news_entity.dart';
import 'package:news_app/features/home/domain/use_case/get_news_use_case.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getNewsUseCase) : super(HomeInitial());
  final GetNewsUseCase _getNewsUseCase;
  Future<void> intent(HomeIntent intent) async {
    switch (intent) {
      case FetchNewsIntent():
        await _fetchNews(intent.id);
      case GetSourceIntent():
        await _getSource();
    }
  }

  Future<void> _fetchNews(String id) async {
    emit(HomeLoading());
    var result = await _getNewsUseCase.invoke();
    switch (result) {
      case Success<NewsEntity>():
        emit(HomeSuccess(result.data.articles));
      case Error<NewsEntity>():
        emit(HomeError(result.messageaEroor));
    }
  }

  Future<void> _getSource() async {}
}

sealed class HomeIntent {}

class FetchNewsIntent extends HomeIntent {
  String id;
  FetchNewsIntent(this.id);
}

class GetSourceIntent extends HomeIntent {}
