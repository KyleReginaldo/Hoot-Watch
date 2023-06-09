// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:yoyo/domain/entity/title_entity.dart';
part 'title_model.g.dart';

@HiveType(typeId: 1)
class TitleModel extends TitleEntity {
  @override
  @HiveField(0)
  final String? romaji;
  @override
  @HiveField(1)
  final String? english;
  @override
  @HiveField(2)
  final String? native;
  @override
  @HiveField(3)
  final String? userPreferred;
  TitleModel({
    this.romaji,
    this.english,
    this.native,
    this.userPreferred,
  }) : super(
          romaji: romaji,
          english: english,
          native: native,
          userPreferred: userPreferred,
        );
  factory TitleModel.fromMap(Map<String, dynamic> json) {
    return TitleModel(
      romaji: json["romaji"],
      english: json["english"],
      native: json["native"],
      userPreferred: json["userPreferred"],
    );
  }
  factory TitleModel.fromE(TitleEntity title) {
    return TitleModel(
      romaji: title.romaji,
      english: title.english,
      native: title.native,
      userPreferred: title.userPreferred,
    );
  }
  Map<String, dynamic> toMap() => {
        "romaji": romaji,
        "english": english,
        "native": native,
        "userPreferred": userPreferred,
      };
}
