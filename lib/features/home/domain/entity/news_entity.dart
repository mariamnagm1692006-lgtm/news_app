import '../../presentation/view/screens/home_screen.dart';

class NewsEntity {
  String status;
  int totalResults;
  List<ArticleEntity> articles;

  NewsEntity({
    this.status = 'Error',
    this.totalResults = 0,
    this.articles = const [],
  });
}

class ArticleEntity {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleEntity({
    this.author = 'Mariam Negm',
    this.title = 'Not Found',
    this.description = 'Not Found',
    this.url = 'https://google.com',
    this.urlToImage = dummyImage,
    this.content = 'Not Found',
  });
}
