import 'package:floor/floor.dart';
import 'package:news_application/src/core/constants/constants.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';

@Entity(tableName: 'articles', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
          ? map['urlToImage']
          : kDefaultImage,
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity article) {
    return ArticleModel(
      id: article.id,
      author: article.author,
      title: article.title,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      content: article.content,
    );
  }
}

class ArticleResponseModel {
  const ArticleResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<ArticleModel>.from(
        json['articles'].map(
          (x) => ArticleModel.fromJson(x),
        ),
      ),
    );
  }
}
