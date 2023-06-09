// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yoyo/core/dtos/auth_dto.dart';
import 'package:yoyo/domain/repository/repository.dart';

import '../../../core/error/failure.dart';

class Login {
  final Repository repo;
  Login({
    required this.repo,
  });

  Future<Either<Failure, void>> call({required AuthDto authDto}) async {
    return await repo.login(authDto: authDto);
  }
}
