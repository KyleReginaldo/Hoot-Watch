// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/streamlink_entity.dart';

class FetchStreamLinks {
  final Repository repo;
  FetchStreamLinks({
    required this.repo,
  });

  Future<Either<Failure, StreamLinkEntity>> call(String id) async {
    return await repo.fetchStreamingLinks(id);
  }
}
