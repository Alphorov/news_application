import 'package:news_application/src/core/usecase/usecase.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';

class InsertArticleUseCase implements UseCase<void, ArticleEntity> {
  const InsertArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;
  @override
  Future<void> call({required ArticleEntity params}) =>
      _articleRepository.saveArticle(params);
}
