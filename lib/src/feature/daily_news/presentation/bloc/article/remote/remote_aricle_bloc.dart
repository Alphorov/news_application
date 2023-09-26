import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_application/src/core/resources/data_state.dart';
import 'package:news_application/src/feature/daily_news/domain/entities/article.dart';
import 'package:news_application/src/feature/daily_news/domain/usecase/get_article.dart';

part 'remote_aricle_event.dart';
part 'remote_aricle_state.dart';

class RemoteAricleBloc extends Bloc<RemoteAricleEvent, RemoteAricleState> {
  RemoteAricleBloc(this._getArticleUseCase)
      : super(const RemoteAricleLoading()) {
    on<RemoteAricleFetch>(_onFetchArticles);
  }

  final GetArticleUseCase _getArticleUseCase;

  Future<void> _onFetchArticles(
      RemoteAricleEvent event, Emitter<RemoteAricleState> emit) async {
    emit(const RemoteAricleLoading());
    final dataState = await _getArticleUseCase.call();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteAricleDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(RemoteAricleError(dataState.error!));
    }
  }
}
