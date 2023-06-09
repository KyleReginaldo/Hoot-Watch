// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:yoyo/domain/entity/trending_entity.dart';

import 'title_model.dart';

part 'trending_model.g.dart';

class LocalTrending {
  final DateTime date;
  final TrendingModel trending;
  LocalTrending({
    required this.date,
    required this.trending,
  });
  factory LocalTrending.fromMap(Map<dynamic, dynamic> map) {
    return LocalTrending(
      date: map.keys.first,
      trending: map.values.first,
    );
  }
}

@HiveType(typeId: 2)
class TrendingModel extends TrendingEntity {
  @override
  @HiveField(0)
  final int currentPage;
  @override
  @HiveField(1)
  final bool hasNextPage;
  @override
  @HiveField(2)
  final List<TrendingResultEntity> results;
  TrendingModel({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  }) : super(
          currentPage: currentPage,
          hasNextPage: hasNextPage,
          results: results,
        );
  factory TrendingModel.fromMap(Map<String, dynamic> json) => TrendingModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        results: List<TrendingResultModel>.from(
            json["results"].map((x) => TrendingResultModel.fromMap(x))),
      );
}

@HiveType(typeId: 3)
class TrendingResultModel extends TrendingResultEntity {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int? malId;
  @override
  @HiveField(2)
  final TitleModel title;
  @override
  @HiveField(3)
  final String image;
  @override
  @HiveField(4)
  final String description;

  @override
  @HiveField(5)
  final String cover;
  @override
  @HiveField(6)
  final int? rating;
  @override
  @HiveField(7)
  final int? releaseDate;
  @override
  @HiveField(8)
  final String? color;
  @override
  @HiveField(9)
  final List<String> genres;
  @override
  @HiveField(10)
  final int? totalEpisodes;
  @override
  @HiveField(11)
  final int? duration;

  TrendingResultModel({
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
  }) : super(
          id: id,
          malId: malId,
          title: title,
          image: image,
          description: description,
          cover: cover,
          rating: rating,
          releaseDate: releaseDate,
          color: color,
          genres: genres,
          totalEpisodes: totalEpisodes,
          duration: duration,
        );
  factory TrendingResultModel.fromMap(Map<String, dynamic> json) =>
      TrendingResultModel(
        id: json["id"],
        malId: json["malId"],
        title: TitleModel.fromMap(json["title"]),
        image: json["image"],
        description: json["description"],
        cover: json["cover"],
        rating: json["rating"],
        releaseDate: json["releaseDate"],
        color: json["color"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        totalEpisodes: json["totalEpisodes"],
        duration: json["duration"] ?? 0,
      );
}
