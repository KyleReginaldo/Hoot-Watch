import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoyo/core/dtos/auth_dto.dart';
import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/data/model/favorite_model.dart';
import 'package:yoyo/data/model/popular_model.dart';
import 'package:yoyo/data/model/recent_release_model.dart';
import 'package:yoyo/data/model/search_model.dart';
import 'package:yoyo/data/model/trending_model.dart';
import 'package:yoyo/data/model/upcoming_model.dart';
import 'package:yoyo/data/model/user_model.dart';

import '../../model/info_model.dart';
import '../../model/last_watched_model.dart';
import '../../model/random_model.dart';
import '../../model/streamlink_model.dart';

abstract class RemoteDatasource {
  Future<TrendingModel> fetchTrendingAnime();
  Future<RecentReleaseModel> fetchRecentAnime();
  Future<InfoModel> fetchAnimeInfo(String id);
  Future<StreamLinkModel> fetchStreamingLinks(String id);
  Stream<User?> userChanges();
  Future<void> login({required AuthDto authDto});
  Future<void> signup({required AuthDto authDto});
  Future<UpcomingModel> fetchUpcomingAnime();
  Future<UserModel> fetchUser({required String uid});
  Future<void> setupUser({required UserModel user, String? dlUrl});
  Future<void> uploadImage({required String path, required File file});
  Future<void> updateUser({required UpdateUserDto updateUserDto});
  Future<String> getDownloadUrl({required String path});
  Future<SearchModel> searchAnime({
    required String query,
    required int limit,
  });
  Future<void> saveLastWatched({
    required String userId,
    required LastWatchedModel info,
  });
  Future<List<LastWatchedModel>> fetchLastWatched({required String userId});
  Future<List<EpisodeModel>> fetchEpisodes({required String id});
  Future<RandomModel> fetchRandomAnime();
  User? fetchFbUser();
  Future<void> addFavorite({
    required String userId,
    required FavoriteModel favorite,
  });
  Future<List<FavoriteModel>> fetchFavorites({required String userId});
  Future<void> removeFavorite({
    required String userId,
    required String animeId,
  });
  Future<LastWatchedModel?> checkLastWatch({
    required String userId,
    required String episodeId,
  });
  Future<List<LastWatchedModel>> lastWatchedEps(
      {required String userId, required String animeId});
  Future<PopularModel> fetchPopularAnime();
}
