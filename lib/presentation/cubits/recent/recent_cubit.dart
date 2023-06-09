// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/recent_release_entity.dart';
import '../../../domain/usecases/fetch_recent_anime.dart';

part 'recent_state.dart';

class RecentCubit extends Cubit<RecentState> {
  RecentCubit(
    this.fetchRecentAnime,
  ) : super(RecentInitial());

  final FetchRecentAnime fetchRecentAnime;

  void onFetchRecentAnime() async {
    emit(RecentLoading());
    final either = await fetchRecentAnime();

    either.fold((l) => emit(RecentError(msg: l.msg)),
        (r) => emit(RecentLoaded(recent: r)));
  }
}
