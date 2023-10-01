import 'package:flutter/material.dart';

import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/article_detail.dart';
import '../../features/daily_news/presentation/pages/daily_news.dart';
import '../../features/daily_news/presentation/pages/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNewsPage());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsPage(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticlesPage());

      default:
        return _materialRoute(const DailyNewsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
