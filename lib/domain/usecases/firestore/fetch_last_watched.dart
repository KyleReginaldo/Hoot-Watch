// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../../core/error/failure.dart';
import '../../entity/last_watched_entity.dart';

class FetchLastWatched {
  final Repository repo;
  FetchLastWatched({
    required this.repo,
  });
  Future<Either<Failure, List<LastWatchedEntity>>> call(
      {required String userId}) async {
    return await repo.fetchLastWatched(userId: userId);
  }
}
