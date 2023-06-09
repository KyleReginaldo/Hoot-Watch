// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/domain/usecases/firestore/add_favorite.dart';
import 'package:yoyo/domain/usecases/firestore/fetch_favorites.dart';
import 'package:yoyo/domain/usecases/firestore/remove_favorite.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this.addFavorite,
    this.fetchFavorites,
    this.removeFavorite,
  ) : super(FavoriteInitial());

  final AddFavorite addFavorite;
  final FetchFavorites fetchFavorites;
  final RemoveFavorite removeFavorite;

  Future<String> onAddFavorite({
    required String userId,
    required FavoriteEntity favorite,
  }) async {
    await addFavorite(
      userId: userId,
      favorite: favorite,
    );
    return userId;
  }

  Future<String> onRemoveFavorite({
    required String userId,
    required String animeId,
  }) async {
    emit(FavoriteLoading());
    await removeFavorite(
      userId: userId,
      animeId: animeId,
    );
    return userId;
  }

  void onFetchFavorites({required String userId}) async {
    emit(FavoriteLoading());
    final favorites = await fetchFavorites(userId: userId);
    if (favorites.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteLoaded(favorites: favorites));
    }
  }
}
