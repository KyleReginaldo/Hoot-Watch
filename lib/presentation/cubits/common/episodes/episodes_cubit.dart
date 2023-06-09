import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/domain/entity/info_entity.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit() : super(const EpisodesState());

  void addEpisodes(List<EpisodeEntity> episodes) {
    emit(state.copyWith(
      episodes: episodes,
      dropdowns: episodes,
      initial: episodes.isNotEmpty ? episodes.first : null,
    ));
  }

  void filterEpisodes(EpisodeEntity episode) {
    emit(
      state.copyWith(
        episodes: state.dropdowns?.where((element) {
          return element.id == episode.id;
        }).toList(),
        initial: episode,
      ),
    );
  }

  void dispose() {
    emit(
      state.copyWith(episodes: null, initial: null, dropdowns: null),
    );
  }
}
