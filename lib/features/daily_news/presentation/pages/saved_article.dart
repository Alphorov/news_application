import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/article.dart';
import '../bloc/article/local/local_article_bloc.dart';
import '../bloc/article/local/local_article_event.dart';
import '../bloc/article/local/local_article_state.dart';
import '../widgets/article_tile.dart';

class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({Key? key}) : super(key: key);

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticles()),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onBackButtonTapped(context),
            child: const Icon(Ionicons.chevron_back, color: Colors.black),
          ),
          title: const Text('Saved Articles',
              style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<LocalArticleBloc, LocalArticlesState>(
          builder: (context, state) {
            final articles = state.articles;
            if (state is LocalArticlesLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is LocalArticlesDone) {
              if (articles?.isEmpty ?? true) {
                return const Center(
                    child: Text(
                  'NO SAVED ARTICLES',
                  style: TextStyle(color: Colors.black),
                ));
              }

              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  return ArticleWidget(
                    article: articles[index],
                    isRemovable: true,
                    onRemove: (article) => _onRemoveArticle(context, article),
                    onArticlePressed: (article) =>
                        _onArticlePressed(context, article),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
