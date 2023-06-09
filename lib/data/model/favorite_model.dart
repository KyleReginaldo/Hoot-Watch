import 'package:yoyo/data/model/title_model.dart';
import 'package:yoyo/domain/entity/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.id,
    required super.malId,
    required super.image,
    required super.title,
    super.color,
    required super.uploadedAt,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      malId: map['malId'],
      image: map['image'],
      title: TitleModel.fromMap(map['title']),
      color: map['color'],
      uploadedAt: map['uploadedAt'],
    );
  }
  factory FavoriteModel.fromE(FavoriteEntity favorite) {
    return FavoriteModel(
      id: favorite.id,
      malId: favorite.malId,
      image: favorite.image,
      title: favorite.title,
      color: favorite.color,
      uploadedAt: favorite.uploadedAt,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "malId": malId,
      "image": image,
      'title': TitleModel.fromE(title).toMap(),
      "color": color,
      "uploadedAt": uploadedAt,
    };
  }
}
