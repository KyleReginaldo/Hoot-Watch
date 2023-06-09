// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/entity/user_entity.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../../core/error/failure.dart';

class SetupUser {
  final Repository repo;
  SetupUser({
    required this.repo,
  });

  Future<Either<Failure, void>> call(
      {required UserEntity user, String? dlUrl}) async {
    return await repo.setupUser(user: user, dlUrl: dlUrl);
  }
}
