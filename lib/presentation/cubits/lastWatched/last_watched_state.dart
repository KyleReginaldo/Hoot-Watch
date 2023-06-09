// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'last_watched_cubit.dart';

abstract class LastWatchedState extends Equatable {
  const LastWatchedState();

  @override
  List<Object> get props => [];
}

class LastWatchedInitial extends LastWatchedState {}

class LastWatchedLoaded extends LastWatchedState {
  final List<LastWatchedEntity> animes;
  const LastWatchedLoaded({
    required this.animes,
  });
  @override
  List<Object> get props => [animes];
}

class LastWatchedError extends LastWatchedState {}

class LastWatchedLoading extends LastWatchedState {}

class Saving extends LastWatchedState {}

class Saved extends LastWatchedState {
  final String userId;
  final String? episodeId;
  final String? animeId;
  const Saved({
    required this.userId,
    this.episodeId,
    this.animeId,
  });
}
