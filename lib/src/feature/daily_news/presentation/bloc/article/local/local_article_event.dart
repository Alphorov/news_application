part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  const LocalArticleEvent(this.article);

  final ArticleEntity? article;

  @override
  List<Object> get props => [article!];
}

class LocalArticleFetch extends LocalArticleEvent {
  const LocalArticleFetch() : super(null);
}

class LocalArticleInsert extends LocalArticleEvent {
  const LocalArticleInsert(super.article);
}

class LocalArticleDelete extends LocalArticleEvent {
  const LocalArticleDelete(super.article);
}
