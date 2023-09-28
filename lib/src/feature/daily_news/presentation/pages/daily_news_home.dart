import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/remote/remote_aricle_bloc.dart';
import 'package:news_application/src/feature/daily_news/presentation/pages/daily_news_detail.dart';
import 'package:news_application/src/feature/daily_news/presentation/widget/article_tile.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({Key? key}) : super(key: key);

  bool articleIsValid(ArticleEntity article) {
    final articleIsRemoved = article.title?.toUpperCase() == '[REMOVED]' &&
        article.description?.toUpperCase() == '[REMOVED]';
    return !articleIsRemoved;
  }

  void _onTap(ArticleEntity article, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DailyNewsDetailPage(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteAricleBloc, RemoteAricleState>(
        builder: (context, state) {
          if (state is RemoteAricleLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is RemoteAricleError) {
            return Center(
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
              ),
            );
          }
          if (state is RemoteAricleDone) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                final article = state.articles![index];
                if (articleIsValid(article)) {
                  return ArticleWidget(
                    article: article,
                    onTap: (article) => _onTap(article, context),
                  );
                }
                return const SizedBox();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
