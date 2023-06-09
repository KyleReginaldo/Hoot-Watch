import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/domain/entity/last_watched_entity.dart';
import 'package:yoyo/domain/usecases/firestore/fetch_last_watched.dart';

import '../../../domain/usecases/firestore/save_last_watched.dart';

part 'last_watched_state.dart';

class LastWatchedCubit extends Cubit<LastWatchedState> {
  LastWatchedCubit(this.saveLastWatched, this.fetchLastWatched)
      : super(LastWatchedInitial());

  final SaveLastWatched saveLastWatched;
  final FetchLastWatched fetchLastWatched;

  Future<void> onSaveLastWatched({
    required String userId,
    required LastWatchedEntity info,
    String? episodeId,
    String? animeId,
  }) async {
    emit(Saving());
    final either = await saveLastWatched(userId: userId, info: info);
    either.fold((l) {
      emit(LastWatchedError());
    },
        (r) => emit(Saved(
              animeId: animeId,
              episodeId: episodeId,
              userId: userId,
            )));
  }

  Future<bool> onFetchLastWatched({
    required String userId,
    LastWatchedEntity? info,
  }) async {
    emit(LastWatchedLoading());
    if (info != null) {
      final either1 = await saveLastWatched(userId: userId, info: info);
      either1.fold((l) {
        emit(LastWatchedError());
      }, (r) => null);
    }
    final either2 = await fetchLastWatched(userId: userId);

    either2.fold((l) => emit(LastWatchedError()), (r) {
      emit(LastWatchedLoaded(animes: r));
    });
    return true;
  }
}
