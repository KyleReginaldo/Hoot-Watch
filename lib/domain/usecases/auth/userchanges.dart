// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoyo/domain/repository/repository.dart';

class Userchanges {
  final Repository repo;
  Userchanges({
    required this.repo,
  });
  Stream<User?> call() {
    return repo.userChanges();
  }
}
