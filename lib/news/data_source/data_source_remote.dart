import 'package:news_app/news/data_source/data_source_interface.dart';

class DataSourceRemote implements DataSourceInterface {
  @override
  Future<List<String>> getNews() {
    List<String?> news = ['data from remot', 'data from remot', null];
    List<String> newNews = news
        .where((element) {
          return element != null;
        })
        .nonNulls
        .toList();
    return Future.value(newNews);
  }
}
