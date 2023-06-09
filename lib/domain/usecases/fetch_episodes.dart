// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/info_entity.dart';

class FetchEpisodes {
  final Repository repo;
  FetchEpisodes({
    required this.repo,
  });

  Future<Either<Failure, List<EpisodeEntity>>> call(
      {required String id}) async {
    return await repo.fetchEpisodes(id: id);
  }
}
