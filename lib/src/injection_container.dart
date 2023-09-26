import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_application/src/feature/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/get_article.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/remote/remote_aricle_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl()),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl()),
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  sl.registerFactory<RemoteAricleBloc>(
    () => RemoteAricleBloc(sl()),
  );
}
