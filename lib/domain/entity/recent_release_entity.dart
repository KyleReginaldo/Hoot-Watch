import 'package:yoyo/domain/entity/title_entity.dart';

class RecentReleaseEntity {
  RecentReleaseEntity({
    required this.currentPage,
    required this.hasNextPage,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  final int currentPage;
  final bool hasNextPage;
  final int totalPages;
  final int totalResults;
  final List<RecentResultEntity> results;
}

class RecentResultEntity {
  RecentResultEntity({
    required this.id,
    required this.malId,
    required this.title,
    required this.image,
    this.rating,
    this.color,
    required this.episodeId,
    required this.episodeTitle,
    required this.episodeNumber,
    required this.genres,
  });

  final String id;
  final int malId;
  final TitleEntity title;
  final String image;
  final int? rating;
  final String? color;
  final String episodeId;
  final String episodeTitle;
  final int episodeNumber;
  final List<String> genres;
}
