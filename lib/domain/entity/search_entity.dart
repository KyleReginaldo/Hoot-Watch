import 'package:yoyo/domain/entity/title_entity.dart';

class SearchEntity {
  SearchEntity({
    this.currentPage,
    required this.hasNextPage,
    required this.results,
  });

  final int? currentPage;
  final bool hasNextPage;
  final List<ResultEntity> results;
}

class ResultEntity {
  ResultEntity({
    required this.id,
    this.malId,
    required this.title,
    required this.status,
    required this.image,
    this.cover,
    required this.popularity,
    this.description,
    this.rating,
    required this.genres,
    this.color,
    this.totalEpisodes,
    this.currentEpisodeCount,
    required this.type,
    required this.releaseDate,
  });

  final String id;
  final int? malId;
  final TitleEntity title;
  final String status;
  final String image;
  final String? cover;
  final int popularity;
  final String? description;
  final int? rating;
  final List<String> genres;
  final String? color;
  final int? totalEpisodes;
  final int? currentEpisodeCount;
  final String type;
  final int? releaseDate;
}
