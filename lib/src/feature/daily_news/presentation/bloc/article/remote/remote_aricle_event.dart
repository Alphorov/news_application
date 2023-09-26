part of 'remote_aricle_bloc.dart';

sealed class RemoteAricleEvent extends Equatable {
  const RemoteAricleEvent();

  @override
  List<Object> get props => [];
}

final class RemoteAricleFetch extends RemoteAricleEvent {
  const RemoteAricleFetch();
}
