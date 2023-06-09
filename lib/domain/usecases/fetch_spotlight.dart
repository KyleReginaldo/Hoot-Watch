// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/spotlight_entity.dart';

class FetchSpotlight {
  final Repository repo;
  FetchSpotlight({
    required this.repo,
  });

  Future<Either<Failure, SpotlightEntity>> call() async {
    return await repo.fetchSpotlight();
  }
}
