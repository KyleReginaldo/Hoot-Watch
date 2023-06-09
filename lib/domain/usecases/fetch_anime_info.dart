// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/info_entity.dart';

class FetchAnimeInfo {
  final Repository repo;
  FetchAnimeInfo({
    required this.repo,
  });
  Future<Either<Failure, InfoEntity>> call(String id) async {
    return await repo.fetchAnimeInfo(id);
  }
}
