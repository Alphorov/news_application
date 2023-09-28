import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_application/src/core/constants/constants.dart';
import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/local/app_database.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_application/src/feature/daily_news/data/model/article.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  const ArticleRepositoryImpl({
    required NewsApiService newsApiService,
    required AppDatabase appDatabase,
  })  : _newsApiService = newsApiService,
        _appDatabase = appDatabase;

  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final res = await _newsApiService.getArticles(
        countryQuery,
        newsApiKey,
        categoryQuery,
      );

      if (res.response.statusCode == HttpStatus.ok &&
          res.data.articles.isNotEmpty) {
        return DataSuccess(res.data.articles);
      } else {
        return DataError(DioException(
          requestOptions: res.response.requestOptions,
          error: res.response.statusMessage,
          response: res.response,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity article) =>
      _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));

  @override
  Future<List<ArticleModel>> getSavedArticles() =>
      _appDatabase.articleDAO.getArticles();

  @override
  Future<void> saveArticle(ArticleEntity article) =>
      _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
}
