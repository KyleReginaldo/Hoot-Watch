// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LastWatchedEntity extends Equatable {
  final String episodeId;
  final String image;
  final String animeId;
  final String updatedAt;
  final String title;
  final int episodeNumber;
  final ContinueAtEntity continueAt;
  final String duration;
  const LastWatchedEntity({
    required this.episodeId,
    required this.image,
    required this.animeId,
    required this.updatedAt,
    required this.title,
    required this.episodeNumber,
    required this.continueAt,
    required this.duration,
  });

  @override
  List<Object?> get props => [animeId];
}

class ContinueAtEntity {
  final String id;
  final String willContinueAt;
  ContinueAtEntity({
    required this.id,
    required this.willContinueAt,
  });
}
