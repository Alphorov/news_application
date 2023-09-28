import 'package:flutter/material.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/presentation/widget/publication_time.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, this.article, this.onTap}) : super(key: key);

  final ArticleEntity? article;
  final Function(ArticleEntity)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => article != null ? onTap?.call(article!) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Image(url: article?.urlToImage),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Text(
                    article?.title ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article?.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  PublicationTime(publishedAt: article?.publishedAt ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          url ?? '',
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 5,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300,
            ),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 5,
            child: const Center(
              child: Icon(
                Icons.error_outline_sharp,
                color: Colors.white,
              ),
            ),
          ),
          fit: BoxFit.cover,
        ),
      );
}
