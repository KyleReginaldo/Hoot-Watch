// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoyo/domain/repository/repository.dart';

class FetchFbUser {
  final Repository repo;
  FetchFbUser({
    required this.repo,
  });

  User? call() {
    return repo.fetchFbUser();
  }
}
