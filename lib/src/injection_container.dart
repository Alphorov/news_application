import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/local/app_database.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_application/src/feature/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/get_article.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/remote/remote_aricle_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  /// Database
  sl.registerSingleton<AppDatabase>(database);

  /// Rest Client
  sl.registerSingleton<Dio>(Dio());

  /// Remote Data Source
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  /// Repository
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(newsApiService: sl(), appDatabase: sl()));

  /// Use Case
  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));

  /// Bloc
  sl.registerFactory<RemoteAricleBloc>(() => RemoteAricleBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(
        getArticlesUseCase: sl(),
        insertArticleUseCase: sl(),
        deleteArticleUseCase: sl()),
  );
}
