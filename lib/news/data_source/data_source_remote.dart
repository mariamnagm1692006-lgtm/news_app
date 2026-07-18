import 'package:news_app/features/home/data/models/model.dart';
import 'package:news_app/news/data_source/data_source_interface.dart';

class DataSourceRemote implements DataSourceInterface {
  @override
  void getNews() {
    print("remote");
  }
}
