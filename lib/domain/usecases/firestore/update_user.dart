// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/domain/repository/repository.dart';

class UpdateUser {
  final Repository repo;
  UpdateUser({
    required this.repo,
  });
  Future<void> call({required UpdateUserDto updateUserDto}) async {
    await repo.updateUser(updateUserDto: updateUserDto);
  }
}
