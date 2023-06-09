import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoyo/core/error/failure.dart';
import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import 'package:yoyo/domain/entity/last_watched_entity.dart';
import 'package:yoyo/domain/entity/recent_release_entity.dart';
import 'package:yoyo/domain/entity/search_entity.dart';
import 'package:yoyo/domain/entity/streamlink_entity.dart';
import 'package:yoyo/domain/entity/user_entity.dart';

import '../../core/dtos/auth_dto.dart';
import '../../core/dtos/update_user_dto.dart';
import '../entity/popular_entity.dart';
import '../entity/random_entity.dart';
import '../entity/spotlight_entity.dart';

abstract class Repository {
  Future<Either<Failure, RecentReleaseEntity>> fetchRecentAnime();
  Future<Either<Failure, InfoEntity>> fetchAnimeInfo(String id);
  Future<Either<Failure, StreamLinkEntity>> fetchStreamingLinks(String id);
  Stream<User?> userChanges();
  Future<Either<Failure, void>> login({required AuthDto authDto});
  Future<Either<Failure, void>> signup({required AuthDto authDto});
  Future<Either<Failure, UserEntity>> fetchUser({required String uid});
  Future<Either<Failure, void>> setupUser(
      {required UserEntity user, String? dlUrl});
  Future<void> uploadImage({required String path, required File file});
  Future<String> getDownloadUrl({required String path});
  Future<Either<Failure, SearchEntity>> searchAnime({
    required String query,
    required int limit,
  });
  Future<Either<Failure, void>> saveLastWatched(
      {required String userId, required LastWatchedEntity info});
  Future<Either<Failure, List<LastWatchedEntity>>> fetchLastWatched(
      {required String userId});
  Future<Either<Failure, List<EpisodeEntity>>> fetchEpisodes(
      {required String id});
  Future<Either<Failure, RandomEntity>> fetchRandomAnime();
  User? fetchFbUser();
  Future<void> addFavorite({
    required String userId,
    required FavoriteEntity favorite,
  });
  Future<List<FavoriteEntity>> fetchFavorites({required String userId});
  Future<void> removeFavorite({
    required String userId,
    required String animeId,
  });
  Future<LastWatchedEntity?> checkLastWatch({
    required String userId,
    required String episodeId,
  });
  Future<void> updateUser({required UpdateUserDto updateUserDto});
  Future<Either<Failure, PopularEntity>> fetchPopularAnime();
  Future<Either<Failure, SpotlightEntity>> fetchSpotlight();
  Future<List<LastWatchedEntity>> lastWatchedEps(
      {required String userId, required String animeId});
}
