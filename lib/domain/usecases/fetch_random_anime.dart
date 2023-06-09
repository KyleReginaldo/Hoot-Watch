// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/random_entity.dart';

class FetchRandomAnime {
  final Repository repo;
  FetchRandomAnime({
    required this.repo,
  });

  Future<Either<Failure, RandomEntity>> call() async {
    return await repo.fetchRandomAnime();
  }
}
