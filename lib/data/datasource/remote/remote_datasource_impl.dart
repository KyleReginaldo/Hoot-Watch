import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yoyo/core/dtos/auth_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/core/error/exception.dart';
import 'package:yoyo/data/datasource/remote/remote_datasource.dart';
import 'package:yoyo/data/model/favorite_model.dart';
import 'package:yoyo/data/model/info_model.dart';
import 'package:yoyo/data/model/popular_model.dart';
import 'package:yoyo/data/model/random_model.dart';
import 'package:yoyo/data/model/recent_release_model.dart';
import 'package:yoyo/data/model/search_model.dart';
import 'package:yoyo/data/model/streamlink_model.dart';
import 'package:yoyo/data/model/trending_model.dart';
import 'package:http/http.dart' as http;
import 'package:yoyo/data/model/upcoming_model.dart';
import 'package:yoyo/data/model/user_model.dart';

import '../../../core/constants/meta_anilist.dart';
import '../../model/last_watched_model.dart';

class RemoteDsatasourceImpl implements RemoteDatasource {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  Future<TrendingModel> fetchTrendingAnime() async {
    const String url = "${MetaAnilist.BASE_URL}/meta/anilist/trending";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return TrendingModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<RecentReleaseModel> fetchRecentAnime() async {
    const String url = "${MetaAnilist.BASE_URL}/meta/anilist/recent-episodes";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return RecentReleaseModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<InfoModel> fetchAnimeInfo(String id) async {
    String url = "${MetaAnilist.BASE_URL}/meta/anilist/info/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return InfoModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<StreamLinkModel> fetchStreamingLinks(String id) async {
    String url = "${MetaAnilist.BASE_URL}/meta/anilist/watch/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return StreamLinkModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<void> login({required AuthDto authDto}) async {
    await auth.signInWithEmailAndPassword(
      email: authDto.email,
      password: authDto.password,
    );
  }

  @override
  Future<void> signup({required AuthDto authDto}) async {
    await auth
        .createUserWithEmailAndPassword(
      email: authDto.email,
      password: authDto.password,
    )
        .then((value) async {
      await db.collection('user').doc(value.user?.uid).set({
        'email': value.user?.email,
        'username': authDto.username,
        'imageLink': authDto.imageLink,
        'isVerified': authDto.isVerified,
        'password': authDto.password,
        'uid': value.user?.uid,
      });
    });
  }

  @override
  Stream<User?> userChanges() => auth.userChanges();

  @override
  Future<UpcomingModel> fetchUpcomingAnime() async {
    String url =
        "${MetaAnilist.BASE_URL}/meta/anilist/airing-schedule?notYetAired=true";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return UpcomingModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<UserModel> fetchUser({required String uid}) async {
    final userSnap = await db.collection('user').doc(uid).get();
    return UserModel.fromMap(userSnap.data()!);
  }

  @override
  Future<void> setupUser({required UserModel user, String? dlUrl}) async {
    user.imageLink = dlUrl;
    await db
        .collection('user')
        .doc(user.uid)
        .set(user.toMap())
        .then((value) async {
      await auth.currentUser?.updateDisplayName(user.username);
    });
  }

  @override
  Future<String> getDownloadUrl({required String path}) async {
    return await storage.ref(path).getDownloadURL();
  }

  @override
  Future<void> uploadImage({required String path, required File file}) async {
    await storage.ref(path).putFile(file);
  }

  @override
  Future<SearchModel> searchAnime({
    required String query,
    required int limit,
  }) async {
    String urlLoaded =
        "${MetaAnilist.BASE_URL}/meta/anilist/advanced-search?query=$query";
    String urlEmpty = "${MetaAnilist.BASE_URL}/meta/anilist/advanced-search";
    final response =
        await http.get(Uri.parse(query.isEmpty ? urlEmpty : urlLoaded));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      if (rawBody['results'] != null) {
        return SearchModel.fromMap(rawBody);
      }
      throw ServerException(msg: 'server is down');
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<void> saveLastWatched({
    required String userId,
    required LastWatchedModel info,
  }) async {
    final ref = await db
        .collection('user')
        .doc(userId)
        .collection('lastWatched')
        .doc(info.episodeId)
        .get();
    if (ref.data() != null) {
      await db
          .collection('user')
          .doc(userId)
          .collection('lastWatched')
          .doc(info.episodeId)
          .update(info.toMap());
    } else {
      await db
          .collection('user')
          .doc(userId)
          .collection('lastWatched')
          .doc(info.episodeId)
          .set(info.toMap());
    }
  }

  @override
  Future<List<LastWatchedModel>> fetchLastWatched(
      {required String userId}) async {
    final colRef = db.collection('user').doc(userId).collection('lastWatched');
    final querySnap = await colRef.orderBy('updatedAt', descending: true).get();
    return querySnap.docs
        .map((e) => LastWatchedModel.fromMap(e.data()))
        .toList();
  }

  @override
  Future<List<EpisodeModel>> fetchEpisodes({required String id}) async {
    List<EpisodeModel> episodes = [];
    String url = "${MetaAnilist.BASE_URL}/meta/anilist/info/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      rawBody['episodes'].forEach((data) {
        episodes.add(EpisodeModel.fromMap(data));
      });
      return episodes;
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<RandomModel> fetchRandomAnime() async {
    String url = "${MetaAnilist.BASE_URL}/meta/anilist/random-anime";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return RandomModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  User? fetchFbUser() {
    return auth.currentUser;
  }

  @override
  Future<void> addFavorite({
    required String userId,
    required FavoriteModel favorite,
  }) async {
    await db
        .collection('user')
        .doc(userId)
        .collection('favorite')
        .doc(favorite.id)
        .set(favorite.toMap());
  }

  @override
  Future<List<FavoriteModel>> fetchFavorites({
    required String userId,
  }) async {
    final docRef = db.collection('user').doc(userId).collection('favorite');
    final querySnap =
        await docRef.orderBy('uploadedAt', descending: true).get();
    return querySnap.docs.map((e) => FavoriteModel.fromMap(e.data())).toList();
  }

  @override
  Future<void> removeFavorite(
      {required String userId, required String animeId}) async {
    await db
        .collection('user')
        .doc(userId)
        .collection('favorite')
        .doc(animeId)
        .delete();
  }

  @override
  Future<LastWatchedModel?> checkLastWatch(
      {required String userId, required String episodeId}) async {
    final data = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('lastWatched')
        .doc(episodeId)
        .get();
    if (data.data() != null) {
      return LastWatchedModel.fromMap(data.data()!);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateUser({required UpdateUserDto updateUserDto}) async {
    await db.collection('user').doc(updateUserDto.uid).update({
      "username": updateUserDto.username,
      "bio": updateUserDto.bio,
      "imageLink": updateUserDto.imageLink,
    }).then((value) async {
      await auth.currentUser?.updateDisplayName(updateUserDto.username);
      await auth.currentUser?.updatePhotoURL(updateUserDto.imageLink);
    });
  }

  @override
  Future<PopularModel> fetchPopularAnime() async {
    String url = "${MetaAnilist.BASE_URL}/meta/anilist/popular";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final rawBody = jsonDecode(response.body);
      return PopularModel.fromMap(rawBody);
    } else {
      throw ServerException(msg: 'server is down');
    }
  }

  @override
  Future<List<LastWatchedModel>> lastWatchedEps({
    required String userId,
    required String animeId,
  }) async {
    final docRef = db.collection('user').doc(userId).collection('lastWatched');
    final querySnap = await docRef
        .where('animeId', isEqualTo: animeId)
        .orderBy('updatedAt', descending: true)
        .get();
    return querySnap.docs
        .map((e) => LastWatchedModel.fromMap(e.data()))
        .toList();
  }
}
