// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/repository/repository.dart';

class RemoveFavorite {
  final Repository repo;
  RemoveFavorite({
    required this.repo,
  });
  Future<void> call({
    required String userId,
    required String animeId,
  }) async {
    await repo.removeFavorite(userId: userId, animeId: animeId);
  }
}
