import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_application/src/core/constants/constants.dart';
import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_application/src/feature/daily_news/data/model/article.dart';
import 'package:news_application/src/feature/daily_news/domain/repository/article_repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  const ArticleRepositoryImpl(this._newsApiService);

  final NewsApiService _newsApiService;

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
}
