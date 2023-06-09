// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:yoyo/core/dtos/auth_dto.dart';
import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/core/error/exception.dart';
import 'package:yoyo/core/error/failure.dart';
import 'package:yoyo/core/utils/custom_functions.dart';
import 'package:yoyo/data/datasource/local/local_datasource.dart';
import 'package:yoyo/data/datasource/remote/remote_datasource.dart';
import 'package:yoyo/data/model/favorite_model.dart';
import 'package:yoyo/data/model/last_watched_model.dart';
import 'package:yoyo/data/model/spotlight_model.dart';
import 'package:yoyo/data/model/user_model.dart';
import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import 'package:yoyo/domain/entity/popular_entity.dart';
import 'package:yoyo/domain/entity/random_entity.dart';
import 'package:yoyo/domain/entity/recent_release_entity.dart';
import 'package:yoyo/domain/entity/search_entity.dart';
import 'package:yoyo/domain/entity/spotlight_entity.dart';
import 'package:yoyo/domain/entity/streamlink_entity.dart';
import 'package:yoyo/domain/entity/trending_entity.dart';
import 'package:yoyo/domain/entity/upcoming_entity.dart';
import 'package:yoyo/domain/entity/user_entity.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../domain/entity/last_watched_entity.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  final LocalDatasource local;
  RepositoryImpl({
    required this.remote,
    required this.local,
  });
  @override
  Future<Either<Failure, TrendingEntity>> fetchTrendingAnime() async {
    final trending = local.getCachedTrending();
    if (trending != null &&
        trending.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(trending.trending);
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((trending != null &&
        !trending.date.isAtSameMomentAs(CustomFunctions.getToday()))) {
      await local.cachedRandom(random: await remote.fetchRandomAnime());
      try {
        return Right(await remote.fetchTrendingAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      await local.cachedTrending(trending: await remote.fetchTrendingAnime());
      try {
        return Right(await remote.fetchTrendingAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  Future<Either<Failure, RecentReleaseEntity>> fetchRecentAnime() async {
    final recent = local.getCachedRecent();
    if (recent != null &&
        recent.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(recent.recent);
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((recent != null &&
        !recent.date.isAtSameMomentAs(CustomFunctions.getToday()))) {
      await local.cachedRecent(recent: await remote.fetchRecentAnime());
      try {
        return Right(await remote.fetchRecentAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      await local.cachedRecent(recent: await remote.fetchRecentAnime());
      try {
        return Right(await remote.fetchRecentAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  Future<Either<Failure, InfoEntity>> fetchAnimeInfo(String id) async {
    try {
      return Right(await remote.fetchAnimeInfo(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, StreamLinkEntity>> fetchStreamingLinks(
      String id) async {
    try {
      return Right(await remote.fetchStreamingLinks(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, void>> login({required AuthDto authDto}) async {
    try {
      await remote.login(authDto: authDto);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(msg: e.message ?? 'invalid user'));
    }
  }

  @override
  Future<Either<Failure, void>> signup({required AuthDto authDto}) async {
    try {
      await remote.signup(authDto: authDto);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(msg: e.message ?? 'invalid user'));
    }
  }

  @override
  Stream<User?> userChanges() => remote.userChanges();

  @override
  Future<Either<Failure, UpcomingEntity>> fetchUpcomingAnime() async {
    final upcoming = local.getCachedUpcoming();
    if (upcoming != null &&
        upcoming.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(upcoming.upcoming);
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((upcoming != null &&
        !upcoming.date.isAtSameMomentAs(CustomFunctions.getToday()))) {
      await local.cachedUpcoming(upcoming: await remote.fetchUpcomingAnime());
      try {
        return Right(await remote.fetchUpcomingAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      await local.cachedUpcoming(upcoming: await remote.fetchUpcomingAnime());
      try {
        return Right(await remote.fetchUpcomingAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUser({required String uid}) async {
    try {
      return Right(await remote.fetchUser(uid: uid));
    } catch (e) {
      print('$e');
      return Left(DefaultFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> setupUser(
      {required UserEntity user, String? dlUrl}) async {
    try {
      await remote.setupUser(user: UserModel.fromE(user), dlUrl: dlUrl);
      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure(msg: '$e'));
    }
  }

  @override
  Future<String> getDownloadUrl({required String path}) async {
    try {
      return await remote.getDownloadUrl(path: path);
    } catch (e) {
      print('download URL: $e');
      rethrow;
    }
  }

  @override
  Future<void> uploadImage({required String path, required File file}) async {
    try {
      await remote.uploadImage(path: path, file: file);
    } catch (e) {
      print('download URL: $e');
    }
  }

  @override
  Future<Either<Failure, SearchEntity>> searchAnime({
    required String query,
    required int limit,
  }) async {
    try {
      return Right(await remote.searchAnime(query: query, limit: limit));
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, void>> saveLastWatched(
      {required String userId, required LastWatchedEntity info}) async {
    try {
      await remote.saveLastWatched(
          userId: userId, info: LastWatchedModel.fromE(info));
      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, List<LastWatchedEntity>>> fetchLastWatched(
      {required String userId}) async {
    try {
      return Right(await remote.fetchLastWatched(userId: userId));
    } catch (e) {
      print("LASTWATCHED ERROR: $e");
      return Left(DefaultFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> fetchEpisodes(
      {required String id}) async {
    try {
      return Right(await remote.fetchEpisodes(id: id));
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, RandomEntity>> fetchRandomAnime() async {
    final random = local.getCachedRandom();
    if (random != null &&
        random.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(random.random);
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((random != null &&
        !random.date.isAtSameMomentAs(CustomFunctions.getToday()))) {
      print('server called=============11');

      await local.cachedRandom(random: await remote.fetchRandomAnime());
      try {
        return Right(await remote.fetchRandomAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      print('server called=============22');
      await local.cachedRandom(random: await remote.fetchRandomAnime());
      try {
        return Right(await remote.fetchRandomAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  User? fetchFbUser() => remote.fetchFbUser();

  @override
  Future<void> addFavorite(
      {required String userId, required FavoriteEntity favorite}) async {
    await remote.addFavorite(
        userId: userId, favorite: FavoriteModel.fromE(favorite));
  }

  @override
  Future<List<FavoriteEntity>> fetchFavorites({required String userId}) async {
    return await remote.fetchFavorites(userId: userId);
  }

  @override
  Future<void> removeFavorite(
      {required String userId, required String animeId}) async {
    await remote.removeFavorite(userId: userId, animeId: animeId);
  }

  @override
  Future<LastWatchedEntity?> checkLastWatch(
      {required String userId, required String episodeId}) async {
    return await remote.checkLastWatch(userId: userId, episodeId: episodeId);
  }

  @override
  Future<void> updateUser({required UpdateUserDto updateUserDto}) async {
    await remote.updateUser(updateUserDto: updateUserDto);
  }

  @override
  Future<Either<Failure, PopularEntity>> fetchPopularAnime() async {
    final popular = local.getCachedPopular();
    if (popular != null &&
        popular.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(popular.popular);
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((popular != null &&
        !popular.date.isAtSameMomentAs(CustomFunctions.getToday()))) {
      await local.cachedPopular(popular: await remote.fetchPopularAnime());
      try {
        return Right(await remote.fetchPopularAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      await local.cachedPopular(popular: await remote.fetchPopularAnime());
      try {
        return Right(await remote.fetchPopularAnime());
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  Future<Either<Failure, SpotlightEntity>> fetchSpotlight() async {
    final upcoming = local.getCachedUpcoming();
    final trending = local.getCachedTrending();
    if (trending != null &&
        trending.date.isAtSameMomentAs(CustomFunctions.getToday()) &&
        upcoming != null &&
        upcoming.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      try {
        return Right(SpotlightModel(
          trending: trending.trending,
          upcoming: upcoming.upcoming,
        ));
      } catch (e) {
        return Left(CacheFailure(msg: '$e'));
      }
    } else if ((trending != null &&
            !trending.date.isAtSameMomentAs(CustomFunctions.getToday())) &&
        upcoming != null &&
        upcoming.date.isAtSameMomentAs(CustomFunctions.getToday())) {
      await local.cachedRandom(random: await remote.fetchRandomAnime());
      await local.cachedUpcoming(upcoming: await remote.fetchUpcomingAnime());
      try {
        return Right(
          SpotlightModel(
            trending: await remote.fetchTrendingAnime(),
            upcoming: await remote.fetchUpcomingAnime(),
          ),
        );
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    } else {
      await local.cachedTrending(trending: await remote.fetchTrendingAnime());
      await local.cachedUpcoming(upcoming: await remote.fetchUpcomingAnime());
      try {
        return Right(
          SpotlightModel(
            trending: await remote.fetchTrendingAnime(),
            upcoming: await remote.fetchUpcomingAnime(),
          ),
        );
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.msg));
      }
    }
  }

  @override
  Future<List<LastWatchedEntity>> lastWatchedEps({
    required String userId,
    required String animeId,
  }) async {
    try {
      return await remote.lastWatchedEps(userId: userId, animeId: animeId);
    } catch (e) {
      rethrow;
    }
  }
}
