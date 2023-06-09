// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/entity/last_watched_entity.dart';

class LastWatchedModel extends LastWatchedEntity {
  LastWatchedModel({
    required super.episodeId,
    required super.animeId,
    required super.image,
    required super.updatedAt,
    required super.continueAt,
    required super.episodeNumber,
    required super.title,
    required super.duration,
  });

  factory LastWatchedModel.fromMap(Map<String, dynamic> map) {
    return LastWatchedModel(
      episodeId: map['episodeId'],
      animeId: map['animeId'],
      image: map['image'],
      updatedAt: map['updatedAt'],
      continueAt: ContinueAtModel.fromMap(map['continueAt']),
      episodeNumber: map['episodeNumber'],
      title: map['title'],
      duration: map['duration'],
    );
  }
  factory LastWatchedModel.fromE(LastWatchedEntity lastWatched) {
    return LastWatchedModel(
      episodeId: lastWatched.episodeId,
      image: lastWatched.image,
      animeId: lastWatched.animeId,
      updatedAt: lastWatched.updatedAt,
      continueAt: lastWatched.continueAt,
      title: lastWatched.title,
      episodeNumber: lastWatched.episodeNumber,
      duration: lastWatched.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "episodeId": episodeId,
      "animeId": animeId,
      "image": image,
      "updatedAt": updatedAt,
      "continueAt": ContinueAtModel.fromE(continueAt).toMap(),
      "title": title,
      "episodeNumber": episodeNumber,
      "duration": duration,
    };
  }
}

class ContinueAtModel extends ContinueAtEntity {
  ContinueAtModel({required super.id, required super.willContinueAt});

  factory ContinueAtModel.fromMap(Map<String, dynamic> map) {
    return ContinueAtModel(
      id: map['id'],
      willContinueAt: map['willContinueAt'],
    );
  }
  factory ContinueAtModel.fromE(ContinueAtEntity continueAt) {
    return ContinueAtModel(
      id: continueAt.id,
      willContinueAt: continueAt.willContinueAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'willContinueAt': willContinueAt,
    };
  }
}
