import 'package:flutter/material.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/presentation/widget/publication_time.dart';

class DailyNewsDetailPage extends StatelessWidget {
  const DailyNewsDetailPage({required this.article, super.key});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${article.title}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: PublicationTime(publishedAt: article.publishedAt ?? ''),
            ),
            Image.network(article.urlToImage ?? ''),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${article.description} \n\n ${article.content}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
}
