
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/popular_entity.dart';

class FetchPopularAnime {
  final Repository repo;
  FetchPopularAnime({
    required this.repo,
  });
  Future<Either<Failure, PopularEntity>> call() async {
    return await repo.fetchPopularAnime();
  }
}
