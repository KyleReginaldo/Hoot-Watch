// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:yoyo/domain/entity/title_entity.dart';

class RandomEntity {
  final String id;
  final TitleEntity title;
  final int? malId;
  final bool isLicensed;
  final String image;
  final String? color;
  final String cover;
  final String description;
  final int releaseDate;
  final int totalEpisodes;
  final int currentEpisode;
  final List<String> genres;
  final String? season;
  final String subOrDub;
  RandomEntity({
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
  });
}
