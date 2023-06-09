// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/repository/repository.dart';

import '../../entity/last_watched_entity.dart';

class LastWatchEdEps {
  final Repository repo;
  LastWatchEdEps({
    required this.repo,
  });

  Future<List<LastWatchedEntity>> call({
    required String userId,
    required String animeId,
  }) async {
    return await repo.lastWatchedEps(userId: userId, animeId: animeId);
  }
}
