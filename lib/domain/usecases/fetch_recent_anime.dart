// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/recent_release_entity.dart';

class FetchRecentAnime {
  final Repository repo;
  FetchRecentAnime({
    required this.repo,
  });

  Future<Either<Failure, RecentReleaseEntity>> call() async {
    return await repo.fetchRecentAnime();
  }
}
