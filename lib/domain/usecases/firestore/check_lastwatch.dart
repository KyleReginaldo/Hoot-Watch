// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/repository/repository.dart';

import '../../entity/last_watched_entity.dart';

class CheckLastwatch {
  final Repository repo;
  CheckLastwatch({
    required this.repo,
  });
  Future<LastWatchedEntity?> call({
    required String userId,
    required String episodeId,
  }) async {
    return await repo.checkLastWatch(userId: userId, episodeId: episodeId);
  }
}
