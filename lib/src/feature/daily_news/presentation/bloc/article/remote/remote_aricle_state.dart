part of 'remote_aricle_bloc.dart';

sealed class RemoteAricleState extends Equatable {
  const RemoteAricleState({this.articles, this.error});

  final List<ArticleEntity>? articles;
  final DioException? error;

  @override
  List<Object> get props => [articles!, error!];
}

final class RemoteAricleLoading extends RemoteAricleState {
  const RemoteAricleLoading();
}

final class RemoteAricleDone extends RemoteAricleState {
  const RemoteAricleDone(List<ArticleEntity> articles) : super(articles: articles);
}

final class RemoteAricleError extends RemoteAricleState {
  const RemoteAricleError(DioException error) : super(error: error);
}
