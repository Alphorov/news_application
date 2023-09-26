import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';

abstract interface class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
