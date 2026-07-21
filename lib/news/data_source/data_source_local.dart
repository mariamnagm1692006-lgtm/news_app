import 'package:news_app/news/data_source/data_source_interface.dart';

class DataSourceLocal implements DataSourceInterface {
  @override
  Future<List<String>> getNews() {
    return Future.value(['data from local','data from local']);
  }
}
