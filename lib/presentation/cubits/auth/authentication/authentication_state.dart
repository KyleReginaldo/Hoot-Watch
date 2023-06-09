// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class LoggingIn extends AuthenticationState {}

class LoggedIn extends AuthenticationState {}

class LogInError extends AuthenticationState {
  final String msg;
  const LogInError({
    required this.msg,
  });
}

class SigningUp extends AuthenticationState {}

class SignedUp extends AuthenticationState {}

class SignUpError extends AuthenticationState {
  final String msg;
  const SignUpError({
    required this.msg,
  });
}
