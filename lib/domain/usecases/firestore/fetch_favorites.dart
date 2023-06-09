// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/domain/repository/repository.dart';

class FetchFavorites {
  final Repository repo;
  FetchFavorites({
    required this.repo,
  });

  Future<List<FavoriteEntity>> call({required String userId}) async {
    return await repo.fetchFavorites(userId: userId);
  }
}
