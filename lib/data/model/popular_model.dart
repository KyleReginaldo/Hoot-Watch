import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoyo/data/model/title_model.dart';

import '../../domain/entity/popular_entity.dart';

part 'popular_model.g.dart';

class LocalPopular {
  final DateTime date;
  final PopularModel popular;
  LocalPopular({
    required this.date,
    required this.popular,
  });
  factory LocalPopular.fromMap(Map<dynamic, dynamic> map) {
    return LocalPopular(
      date: map.keys.first,
      popular: map.values.first,
    );
  }
}

@HiveType(typeId: 8)
class PopularModel extends PopularEntity {
  @override
  @HiveField(1)
  final int currentPage;
  @override
  @HiveField(2)
  final bool hasNextPage;
  @override
  @HiveField(3)
  final List<PopularResultModel> results;

  PopularModel({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  }) : super(
          currentPage: currentPage,
          hasNextPage: hasNextPage,
          results: results,
        );

  factory PopularModel.fromMap(Map<String, dynamic> json) => PopularModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        results: List<PopularResultModel>.from(
            json["results"].map((x) => PopularResultModel.fromMap(x))),
      );
}

@HiveType(typeId: 9)
class PopularResultModel extends PopularResultEntity {
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final int? malId;
  @override
  @HiveField(3)
  final TitleModel title;
  @override
  @HiveField(4)
  final String image;
  @override
  @HiveField(5)
  final String? description;
  @override
  @HiveField(6)
  final String cover;
  @override
  @HiveField(7)
  final int rating;
  @override
  @HiveField(8)
  final int releaseDate;
  @override
  @HiveField(9)
  final String? color;
  @override
  @HiveField(10)
  final List<String> genres;
  @override
  @HiveField(11)
  final int totalEpisodes;
  @override
  @HiveField(12)
  final int duration;

  PopularResultModel({
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

  factory PopularResultModel.fromMap(Map<String, dynamic> json) =>
      PopularResultModel(
        id: json["id"],
        malId: json["malId"],
        title: TitleModel.fromMap(json['title']),
        image: json["image"],
        description: json["description"],
        cover: json["cover"],
        rating: json["rating"],
        releaseDate: json["releaseDate"],
        color: json["color"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        totalEpisodes: json["totalEpisodes"],
        duration: json["duration"],
      );
}
