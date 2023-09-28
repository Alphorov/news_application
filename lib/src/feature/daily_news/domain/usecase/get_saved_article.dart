import 'package:news_application/src/core/usecase/usecase.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  const GetSavedArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;
  @override
  Future<List<ArticleEntity>> call({void params}) =>
      _articleRepository.getSavedArticles();
}
