// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/streamlink_entity.dart';
import 'package:yoyo/domain/usecases/fetch_stream_links.dart';

part 'streamlink_state.dart';

class StreamlinkCubit extends Cubit<StreamlinkState> {
  StreamlinkCubit(
    this.fetchStreamLinks,
  ) : super(StreamlinkInitial());

  final FetchStreamLinks fetchStreamLinks;

  void onFetchStreamLinks(String id, {int? episodeNumber}) async {
    emit(StreamlinkLoading());
    final either = await fetchStreamLinks(id);

    either.fold(
        (l) => emit(StreamlinkError(msg: l.msg)),
        (r) => emit(StreamlinkLoaded(
            streamLink: r, id: id, episodeNumber: episodeNumber ?? 0)));
  }
}
