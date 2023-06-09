// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/entity/title_entity.dart';

class FavoriteEntity {
  final String id;
  final int malId;
  final String image;
  final TitleEntity title;
  final String? color;
  final String uploadedAt;
  FavoriteEntity({
    required this.id,
    required this.malId,
    required this.image,
    required this.title,
    this.color,
    required this.uploadedAt,
  });
}
