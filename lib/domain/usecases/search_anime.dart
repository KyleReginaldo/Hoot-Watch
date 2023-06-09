// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../core/error/failure.dart';
import '../entity/search_entity.dart';

class SearchAnime {
  final Repository repo;
  SearchAnime({
    required this.repo,
  });

  Future<Either<Failure, SearchEntity>> call({
    required String query,
    required int limit,
  }) async {
    return await repo.searchAnime(
      query: query,
      limit: limit,
    );
  }
}
