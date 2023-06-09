// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/last_watched_entity.dart';
import 'package:yoyo/domain/usecases/firestore/last_watched_eps.dart';

abstract class WatchedEpsState extends Equatable {
  const WatchedEpsState();

  @override
  List<Object> get props => [];
}

class Initial extends WatchedEpsState {}

class Loading extends WatchedEpsState {}

class WatchedLoaded extends WatchedEpsState {
  final List<LastWatchedEntity> lastWatched;
  const WatchedLoaded({
    required this.lastWatched,
  });
}

class WatchedEpsCubit extends Cubit<WatchedEpsState> {
  WatchedEpsCubit(
    this.lastWatchedEps,
  ) : super(Initial());
  final LastWatchEdEps lastWatchedEps;

  void onFetchWatchedEps({
    required String userId,
    required String animeId,
  }) async {
    emit(Loading());
    print(
        """
=========================================
============onFetchWatchedEps============
=========================================
""");
    final eps = await lastWatchedEps(userId: userId, animeId: animeId);
    if (eps.isNotEmpty) {
      emit(WatchedLoaded(lastWatched: eps));
    } else {
      emit(Initial());
    }
  }
}
