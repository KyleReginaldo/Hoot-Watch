// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/last_watched_entity.dart';
import 'package:yoyo/domain/usecases/firestore/check_lastwatch.dart';

abstract class LastwatchState extends Equatable {
  const LastwatchState();

  @override
  List<Object> get props => [];
}

class Initial extends LastwatchState {}

class Fetching extends LastwatchState {}

class LWLoaded extends LastwatchState {
  final LastWatchedEntity lastWatched;
  const LWLoaded({
    required this.lastWatched,
  });
}

class LastwatchCubit extends Cubit<LastwatchState> {
  LastwatchCubit(
    this.checkLastwatch,
  ) : super(Initial());
  final CheckLastwatch checkLastwatch;

  void onCheckLastWatch({
    required String userId,
    required String episodeId,
  }) async {
    emit(Fetching());
    print(
        """
=========================================
============onCheckLastWatch============
=========================================
""");
    final lastWatch =
        await checkLastwatch(userId: userId, episodeId: episodeId);
    print(lastWatch?.episodeId);
    if (lastWatch != null) {
      emit(LWLoaded(lastWatched: lastWatch));
    } else {
      emit(Initial());
    }
  }
}
