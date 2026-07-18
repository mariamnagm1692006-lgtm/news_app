import 'package:news_app/news/repo/rebo_interface.dart';
import '../data_source/data_source_interface.dart';
import '../data_source/data_source_local.dart';
import '../data_source/data_source_remote.dart';

class ReboImp implements ReboInterface {
  DataSourceInterface dataSource;
  ReboImp(this.dataSource);
  @override
  void getNews() {
    bool isInternetConnected = false;
    if (isInternetConnected) {
      dataSource = DataSourceRemote();
    } else {
      dataSource = DataSourceLocal();
    }
    dataSource.getNews();
  }
}

void main() {
  ReboImp newsRepository = ReboImp(DataSourceRemote());
  newsRepository.getNews();
}
