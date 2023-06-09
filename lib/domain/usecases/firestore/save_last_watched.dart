// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/entity/last_watched_entity.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../../core/error/failure.dart';

class SaveLastWatched {
  final Repository repo;
  SaveLastWatched({
    required this.repo,
  });

  Future<Either<Failure, void>> call(
      {required String userId, required LastWatchedEntity info}) async {
    return await repo.saveLastWatched(userId: userId, info: info);
  }
}
