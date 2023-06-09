// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'episodes_cubit.dart';

class EpisodesState extends Equatable {
  final List<EpisodeEntity>? episodes;
  final List<EpisodeEntity>? dropdowns;
  final EpisodeEntity? initial;
  const EpisodesState({
    this.episodes,
    this.initial,
    this.dropdowns,
  });

  @override
  List<Object?> get props => [episodes, dropdowns];

  EpisodesState copyWith({
    List<EpisodeEntity>? episodes,
    List<EpisodeEntity>? dropdowns,
    EpisodeEntity? initial,
  }) {
    return EpisodesState(
      episodes: episodes ?? this.episodes,
      dropdowns: dropdowns ?? this.dropdowns,
      initial: initial ?? this.initial,
    );
  }
}
