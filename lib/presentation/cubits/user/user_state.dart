// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserFetched extends UserState {
  final UserEntity user;
  const UserFetched({
    required this.user,
  });
}

class FetchingUser extends UserState {}

class UserError extends UserState {
  final String msg;
  const UserError({
    required this.msg,
  });
}
