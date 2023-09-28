part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  const LocalArticleState(this.articles);

  final List<ArticleEntity>? articles;

  @override
  List<Object> get props => [];
}

final class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading() : super(null);
}

final class LocalArticleLoaded extends LocalArticleState {
  const LocalArticleLoaded(super.articles);
}
