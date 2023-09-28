import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/delete_article.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/get_article.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/insert_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  LocalArticleBloc({
    required GetArticlesUseCase getArticlesUseCase,
    required InsertArticleUseCase insertArticleUseCase,
    required DeleteArticleUseCase deleteArticleUseCase,
  })  : _getArticlesUseCase = getArticlesUseCase,
        _insertArticleUseCase = insertArticleUseCase,
        _deleteArticleUseCase = deleteArticleUseCase,
        super(const LocalArticleLoading()) {
    on<LocalArticleFetch>(_getArticles);
    on<LocalArticleInsert>(_insertArticle);
    on<LocalArticleDelete>(_deleteArticle);
  }

  final GetArticlesUseCase _getArticlesUseCase;
  final InsertArticleUseCase _insertArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  Future<void> _getArticles(LocalArticleFetch event, Emitter emit) async {
    emit(const LocalArticleLoading());
    final articles = await _getArticlesUseCase();
    return emit(LocalArticleLoaded(articles.data));
  }

  Future<void> _insertArticle(LocalArticleInsert event, Emitter emit) async {
    if (event.article == null) return emit(LocalArticleLoaded(state.articles));
    await _insertArticleUseCase(params: event.article!);
    return emit(LocalArticleLoaded(state.articles));
  }

  Future<void> _deleteArticle(LocalArticleDelete event, Emitter emit) async {
    if (event.article == null) return emit(LocalArticleLoaded(state.articles));
    await _deleteArticleUseCase(params: event.article!);
    return emit(LocalArticleLoaded(state.articles));
  }
}
