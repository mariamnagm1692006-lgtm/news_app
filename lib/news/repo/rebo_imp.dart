import 'package:news_app/news/repo/rebo_interface.dart';
import '../data_source/data_source_interface.dart';
import '../data_source/data_source_remote.dart';

class ReboImp implements ReboInterface {
  final DataSourceInterface _dataSource;

  ReboImp(this._dataSource);

  @override
  Future<List<String>> getNews() async => await _dataSource.getNews();
}

void main() {
  ReboImp newsRepository = ReboImp(DataSourceRemote());
  newsRepository.getNews();
}
