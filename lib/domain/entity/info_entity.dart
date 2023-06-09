import '../../data/model/info_model.dart';
import 'title_entity.dart';

class InfoEntity {
  InfoEntity({
    required this.id,
    required this.title,
    this.malId,
    required this.synonyms,
    required this.isLicensed,
    required this.isAdult,
    required this.countryOfOrigin,
    this.trailer,
    required this.image,
    required this.popularity,
    this.color,
    required this.cover,
    this.description,
    required this.status,
    required this.releaseDate,
    required this.startDate,
    required this.endDate,
    this.nextAiringEpisode,
    required this.totalEpisodes,
    required this.currentEpisode,
    this.rating,
    this.duration,
    required this.genres,
    this.season,
    required this.studios,
    required this.subOrDub,
    required this.type,
    required this.recommendations,
    required this.characters,
    required this.relations,
    this.mappings,
    required this.episodes,
  });

  final String id;
  final TitleEntity title;
  final int? malId;
  final List<String> synonyms;
  final bool isLicensed;
  final bool isAdult;
  final String countryOfOrigin;
  final TrailerEntity? trailer;
  final String image;
  final int popularity;
  final String? color;
  final String cover;
  final String? description;
  final String status;
  final int releaseDate;
  final DateEntity startDate;
  final DateEntity endDate;
  final NextAiringEpisodeEntity? nextAiringEpisode;
  final int totalEpisodes;
  final int currentEpisode;
  final int? rating;
  final dynamic duration;
  final List<String> genres;
  final String? season;
  final List<String> studios;
  final String subOrDub;
  final Type type;
  final List<AtionEntity> recommendations;
  final List<CharacterEntity> characters;
  final List<AtionEntity> relations;
  final MappingsEntity? mappings;
  final List<EpisodeEntity> episodes;
}

class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.role,
    required this.name,
    required this.image,
    required this.voiceActors,
  });

  final int id;
  final Role role;
  final NameEntity name;
  final String image;
  final List<VoiceActorEntity> voiceActors;
}

class NameEntity {
  NameEntity({
    this.first,
    this.last,
    required this.full,
    this.native,
    required this.userPreferred,
  });

  final String? first;
  final String? last;
  final String full;
  final String? native;
  final String userPreferred;
}

class VoiceActorEntity {
  VoiceActorEntity({
    required this.id,
    required this.language,
    required this.name,
    required this.image,
  });

  final int id;
  final Language language;
  final NameEntity name;
  final String image;
}

class DateEntity {
  DateEntity({
    this.year,
    this.month,
    this.day,
  });

  final int? year;
  final int? month;
  final int? day;
}

class EpisodeEntity {
  EpisodeEntity({
    required this.id,
    this.title,
    this.description,
    required this.number,
    required this.image,
    this.airDate,
  });

  final String id;
  final String? title;
  final String? description;
  final int number;
  final String image;
  final DateTime? airDate;
}

class MappingsEntity {
  MappingsEntity({
    this.mal,
    this.anidb,
    this.kitsu,
    this.anilist,
    this.thetvdb,
    this.anisearch,
    this.livechart,
    this.notifyMoe,
    this.animePlanet,
  });

  final int? mal;
  final int? anidb;
  final int? kitsu;
  final int? anilist;
  final int? thetvdb;
  final int? anisearch;
  final int? livechart;
  final String? notifyMoe;
  final String? animePlanet;
}

class NextAiringEpisodeEntity {
  NextAiringEpisodeEntity({
    required this.airingTime,
    required this.timeUntilAiring,
    required this.episode,
  });

  final int airingTime;
  final int timeUntilAiring;
  final int episode;
}

class AtionEntity {
  AtionEntity({
    required this.id,
    this.malId,
    this.title,
    required this.status,
    this.episodes,
    required this.image,
    required this.cover,
    this.rating,
    required this.type,
    this.relationType,
    this.color,
  });

  final int id;
  final int? malId;
  final TitleEntity? title;
  final Status status;
  final int? episodes;
  final String image;
  final String cover;
  final int? rating;
  final Type type;
  final String? relationType;
  final String? color;
}

class TrailerEntity {
  TrailerEntity({
    required this.id,
    required this.site,
    required this.thumbnail,
  });
  final String id;
  final String site;
  final String thumbnail;
}
