import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/api/api.dart';
import 'package:news_app/features/home/data/models/model.dart';
import 'package:news_app/features/home/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchNews() async {
    emit(HomeLoading());
    var result = await Api.getNews();
    switch (result) {
      case Success<NewsModel>():
        emit(HomeSuccess(result.data?.articles ?? []));
      case Error<NewsModel>():
        emit(HomeError(result.messageaEroor));
    }
  }
}
