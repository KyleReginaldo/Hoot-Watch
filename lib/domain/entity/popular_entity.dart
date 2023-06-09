import 'package:yoyo/domain/entity/title_entity.dart';

class PopularEntity {
  final int currentPage;
  final bool hasNextPage;
  final List<PopularResultEntity> results;

  PopularEntity({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });
}

class PopularResultEntity {
  final String id;
  final int? malId;
  final TitleEntity title;
  final String image;
  final String? description;
  final String cover;
  final int rating;

  final int releaseDate;

  final String? color;

  final List<String> genres;

  final int totalEpisodes;

  final int duration;

  PopularResultEntity({
    required this.id,
    this.malId,
    required this.title,
    required this.image,
    this.description,
    required this.cover,
    required this.rating,
    required this.releaseDate,
    this.color,
    required this.genres,
    required this.totalEpisodes,
    required this.duration,
  });
}
