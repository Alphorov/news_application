import 'package:dio/dio.dart';
import 'package:news_application/src/core/constants/constants.dart';
import 'package:news_application/src/feature/daily_news/data/model/article.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles(
    @Query('country') String country,
    @Query('apiKey') String apiKey,
    @Query('category') String category,
  );
}
