import 'package:yoyo/data/model/title_model.dart';
import 'package:yoyo/domain/entity/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({
    super.currentPage,
    required super.hasNextPage,
    required super.results,
  });

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromMap(x))),
      );
}

class ResultModel extends ResultEntity {
  ResultModel(
      {required super.id,
      super.malId,
      required super.title,
      required super.status,
      required super.image,
      super.cover,
      required super.popularity,
      super.description,
      super.rating,
      required super.genres,
      super.color,
      required super.totalEpisodes,
      super.currentEpisodeCount,
      required super.type,
      super.releaseDate});
  factory ResultModel.fromMap(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        malId: json["malId"],
        title: TitleModel.fromMap(json["title"]),
        status: json["status"],
        image: json["image"],
        cover: json["cover"],
        popularity: json["popularity"],
        description: json["description"],
        rating: json["rating"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        color: json["color"],
        totalEpisodes: json["totalEpisodes"],
        currentEpisodeCount: json["currentEpisodeCount"],
        type: json["type"],
        releaseDate: json["releaseDate"],
      );
}
