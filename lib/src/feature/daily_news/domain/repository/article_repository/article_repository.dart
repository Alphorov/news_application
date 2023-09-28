import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';

abstract interface class ArticleRepository {
  /// API methods
  Future<DataState<List<ArticleEntity>>> getArticles();

  /// Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);
}
