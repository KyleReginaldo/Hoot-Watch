// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/domain/repository/repository.dart';

class AddFavorite {
  final Repository repo;
  AddFavorite({
    required this.repo,
  });

  Future<void> call(
      {required String userId, required FavoriteEntity favorite}) async {
    await repo.addFavorite(userId: userId, favorite: favorite);
  }
}
