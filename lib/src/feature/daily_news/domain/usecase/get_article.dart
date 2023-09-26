import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/core/usecase/usecase.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  const GetArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) =>
      _articleRepository.getArticles();
}
