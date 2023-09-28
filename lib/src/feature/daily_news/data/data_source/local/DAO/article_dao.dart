import 'package:floor/floor.dart';
import 'package:news_application/src/feature/daily_news/data/model/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();
  @Insert()
  Future<void> insertArticle(ArticleModel articles);
  @delete
  Future<void> deleteArticle(ArticleModel articles);
}
