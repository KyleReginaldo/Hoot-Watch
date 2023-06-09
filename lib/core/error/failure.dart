// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  final String msg;
  Failure({
    required this.msg,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});
}

class CacheFailure extends Failure {
  CacheFailure({required super.msg});
}

class DefaultFailure extends Failure {
  DefaultFailure({required super.msg});
}

class AuthFailure extends Failure {
  AuthFailure({required super.msg});
}
