import 'title_entity.dart';

class TrendingEntity {
  TrendingEntity({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });

  final int currentPage;
  final bool hasNextPage;
  final List<TrendingResultEntity> results;
}

class TrendingResultEntity {
  TrendingResultEntity({
    required this.id,
    this.malId,
    required this.title,
    required this.image,
    required this.description,
    required this.cover,
    this.rating,
    this.releaseDate,
    this.color,
    required this.genres,
    this.totalEpisodes,
    this.duration,
  });

  final String id;
  final int? malId;
  final TitleEntity title;
  final String image;
  final String description;
  final String cover;
  final int? rating;
  final int? releaseDate;
  final String? color;
  final List<String> genres;
  final int? totalEpisodes;
  final int? duration;
}
