import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_appication/features/daily_news/presentation/widgets/publication_date.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/article.dart';
import '../bloc/article/local/local_article_bloc.dart';
import '../bloc/article/local/local_article_event.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({Key? key, this.article}) : super(key: key);

  final ArticleEntity? article;

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticle(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Article saved successfully.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onBackButtonTapped(context),
            child: const Icon(Ionicons.chevron_back, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      article!.title!,
                      style: const TextStyle(
                          fontFamily: 'Butler',
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),

                    const SizedBox(height: 14),
                    // DateTime
                    PublicationDate(publicationDate: article!.publishedAt!),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 250,
                margin: const EdgeInsets.only(top: 14),
                child: Image.network(article!.urlToImage!, fit: BoxFit.cover),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                child: Text(
                  '${article!.description ?? ''}\n\n${article!.content ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onFloatingActionButtonPressed(context),
          child: const Icon(Ionicons.bookmark, color: Colors.white),
        ),
      ),
    );
  }
}
