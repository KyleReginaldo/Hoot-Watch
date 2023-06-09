// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:yoyo/domain/entity/recent_release_entity.dart';

import 'title_model.dart';
part 'recent_release_model.g.dart';

class LocalRecent {
  final DateTime date;
  final RecentReleaseModel recent;
  LocalRecent({
    required this.date,
    required this.recent,
  });
  factory LocalRecent.fromMap(Map<dynamic, dynamic> map) {
    return LocalRecent(
      date: map.keys.first,
      recent: map.values.first,
    );
  }
}

@HiveType(typeId: 4)
class RecentReleaseModel extends RecentReleaseEntity {
  @override
  @HiveField(0)
  final int currentPage;
  @override
  @HiveField(1)
  final bool hasNextPage;
  @override
  @HiveField(2)
  final int totalPages;
  @override
  @HiveField(3)
  final int totalResults;
  @override
  @HiveField(4)
  final List<RecentResultEntity> results;
  RecentReleaseModel({
    required this.currentPage,
    required this.hasNextPage,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  }) : super(
          currentPage: currentPage,
          hasNextPage: hasNextPage,
          totalPages: totalPages,
          totalResults: totalResults,
          results: results,
        );

  factory RecentReleaseModel.fromMap(Map<String, dynamic> json) =>
      RecentReleaseModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        totalPages: json["totalPages"],
        totalResults: json["totalResults"],
        results: List<RecentResultModel>.from(
            json["results"].map((x) => RecentResultModel.fromMap(x))),
      );
}

@HiveType(typeId: 5)
class RecentResultModel extends RecentResultEntity {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int malId;
  @override
  @HiveField(2)
  final TitleModel title;
  @override
  @HiveField(3)
  final String image;
  @override
  @HiveField(4)
  final int? rating;
  @override
  @HiveField(5)
  final String? color;
  @override
  @HiveField(6)
  final String episodeId;
  @override
  @HiveField(7)
  final String episodeTitle;
  @override
  @HiveField(8)
  final int episodeNumber;
  @override
  @HiveField(9)
  final List<String> genres;
  RecentResultModel({
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
  }) : super(
          id: id,
          malId: malId,
          title: title,
          image: image,
          rating: rating,
          color: color,
          episodeId: episodeId,
          episodeTitle: episodeTitle,
          episodeNumber: episodeNumber,
          genres: genres,
        );
  factory RecentResultModel.fromMap(Map<String, dynamic> json) =>
      RecentResultModel(
        id: json["id"],
        malId: json["malId"],
        title: TitleModel.fromMap(json["title"]),
        image: json["image"],
        rating: json["rating"],
        color: json["color"],
        episodeId: json["episodeId"],
        episodeTitle: json["episodeTitle"],
        episodeNumber: json["episodeNumber"],
        genres: List<String>.from(json["genres"].map((x) => x)),
      );
}
