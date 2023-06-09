// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:yoyo/data/model/title_model.dart';
import 'package:yoyo/domain/entity/upcoming_entity.dart';
part 'upcoming_model.g.dart';

class LocalUpcoming {
  final DateTime date;
  final UpcomingModel upcoming;
  LocalUpcoming({
    required this.date,
    required this.upcoming,
  });
  factory LocalUpcoming.fromMap(Map<dynamic, dynamic> map) {
    return LocalUpcoming(
      date: map.keys.first,
      upcoming: map.values.first,
    );
  }
}

@HiveType(typeId: 6)
class UpcomingModel extends UpcomingEntity {
  @override
  @HiveField(0)
  final int currentPage;
  @override
  @HiveField(1)
  final bool hasNextPage;
  @override
  @HiveField(2)
  final List<UpcomingResultEntity> results;
  UpcomingModel({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  }) : super(
          currentPage: currentPage,
          hasNextPage: hasNextPage,
          results: results,
        );

  factory UpcomingModel.fromMap(Map<String, dynamic> json) => UpcomingModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        results: List<UpcomingResultModel>.from(
            json["results"].map((x) => UpcomingResultModel.fromMap(x))),
      );
}

@HiveType(typeId: 7)
class UpcomingResultModel extends UpcomingResultEntity {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int? malId;
  @override
  @HiveField(2)
  final int episode;
  @override
  @HiveField(3)
  final int airingAt;
  @override
  @HiveField(4)
  final TitleModel title;
  @override
  @HiveField(5)
  final String image;
  @override
  @HiveField(6)
  final String? description;
  @override
  @HiveField(7)
  final String cover;
  @override
  @HiveField(8)
  String? color;
  @override
  @HiveField(9)
  final int? rating;
  @override
  @HiveField(10)
  final int? releaseDate;
  UpcomingResultModel({
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
  }) : super(
          id: id,
          malId: malId,
          episode: episode,
          airingAt: airingAt,
          title: title,
          image: image,
          description: description,
          cover: cover,
          color: color,
          rating: rating,
          releaseDate: releaseDate,
        );

  factory UpcomingResultModel.fromMap(Map<String, dynamic> json) =>
      UpcomingResultModel(
        id: json["id"],
        malId: json["malId"],
        episode: json["episode"],
        airingAt: json["airingAt"],
        title: TitleModel.fromMap(json["title"]),
        image: json["image"],
        description: json["description"],
        cover: json["cover"],
        color: json["color"],
        rating: json["rating"],
        releaseDate: json["releaseDate"],
      );
}
