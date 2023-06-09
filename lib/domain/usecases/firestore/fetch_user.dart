// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../../core/error/failure.dart';
import '../../entity/user_entity.dart';

class FetchUser {
  final Repository repo;
  FetchUser({
    required this.repo,
  });
  Future<Either<Failure, UserEntity>> call({required String uid}) async {
    return await repo.fetchUser(uid: uid);
  }
}
