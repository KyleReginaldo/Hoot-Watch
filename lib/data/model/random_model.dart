// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
import 'package:hive_flutter/hive_flutter.dart';

import 'package:yoyo/data/model/title_model.dart';
import 'package:yoyo/domain/entity/random_entity.dart';

part 'random_model.g.dart';

@HiveType(typeId: 0)
class RandomModel extends RandomEntity {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final TitleModel title;
  @override
  @HiveField(2)
  final int? malId;
  @override
  @HiveField(3)
  final bool isLicensed;
  @override
  @HiveField(4)
  final String image;
  @override
  @HiveField(5)
  final String? color;
  @override
  @HiveField(6)
  final String cover;
  @override
  @HiveField(7)
  final String description;
  @override
  @HiveField(8)
  final int releaseDate;
  @override
  @HiveField(9)
  final int totalEpisodes;
  @override
  @HiveField(10)
  final int currentEpisode;
  @override
  @HiveField(11)
  final List<String> genres;
  @override
  @HiveField(12)
  final String? season;
  @override
  @HiveField(13)
  final String subOrDub;

  RandomModel({
    required this.id,
    required this.title,
    this.malId,
    required this.isLicensed,
    required this.image,
    this.color,
    required this.cover,
    required this.description,
    required this.releaseDate,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.genres,
    this.season,
    required this.subOrDub,
  }) : super(
          id: id,
          title: title,
          malId: malId,
          isLicensed: isLicensed,
          image: image,
          color: color,
          cover: cover,
          description: description,
          releaseDate: releaseDate,
          totalEpisodes: totalEpisodes,
          currentEpisode: currentEpisode,
          genres: genres,
          season: season,
          subOrDub: subOrDub,
        );

  factory RandomModel.fromMap(Map<String, dynamic> json) => RandomModel(
        id: json["id"],
        title: TitleModel.fromMap(json["title"]),
        malId: json["malId"],
        isLicensed: json["isLicensed"],
        image: json["image"],
        color: json["color"],
        cover: json["cover"],
        description: json["description"],
        releaseDate: json["releaseDate"],
        totalEpisodes: json["totalEpisodes"],
        currentEpisode: json["currentEpisode"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        season: json["season"],
        subOrDub: json["subOrDub"],
      );
}

class LocalRandom {
  final DateTime date;
  final RandomModel random;
  LocalRandom({
    required this.date,
    required this.random,
  });

  factory LocalRandom.fromMap(Map<dynamic, dynamic> map) {
    return LocalRandom(
      date: map.keys.first,
      random: map.values.first,
    );
  }
}
