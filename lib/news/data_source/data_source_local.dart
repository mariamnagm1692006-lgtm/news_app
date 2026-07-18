import 'package:news_app/news/data_source/data_source_interface.dart';

class DataSourceLocal implements DataSourceInterface {
  @override
  void getNews() {
    print("Local");
  }
}
