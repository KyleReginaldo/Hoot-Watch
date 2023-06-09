import 'package:yoyo/domain/entity/title_entity.dart';

class UpcomingEntity {
  UpcomingEntity({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });

  final int currentPage;
  final bool hasNextPage;
  final List<UpcomingResultEntity> results;
}

class UpcomingResultEntity {
  UpcomingResultEntity({
    required this.id,
    this.malId,
    required this.episode,
    required this.airingAt,
    required this.title,
    required this.image,
    this.description,
    required this.cover,
    this.color,
    this.rating,
    this.releaseDate,
  });

  final String id;
  final int? malId;
  final int episode;
  final int airingAt;
  final TitleEntity title;
  final String image;
  final String? description;
  final String cover;
  String? color;
  final int? rating;
  final int? releaseDate;
}
