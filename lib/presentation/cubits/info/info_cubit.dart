import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import 'package:yoyo/domain/usecases/fetch_anime_info.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this.fetchAnimeInfo) : super(InfoInitial());

  final FetchAnimeInfo fetchAnimeInfo;

  void onFetchAnimeInfo(String id) async {
    emit(InfoLoading());
    final either = await fetchAnimeInfo(id);

    either.fold(
        (l) => emit(InfoError(msg: l.msg)), (r) => emit(InfoLoaded(Info: r)));
  }
}
