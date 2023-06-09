// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_fn_cubit.dart';

abstract class UserFnState extends Equatable {
  const UserFnState();

  @override
  List<Object> get props => [];
}

class UserFnInitial extends UserFnState {}

class Updating extends UserFnState {}

class UpdateDone extends UserFnState {}

class UpdateError extends UserFnState {
  final String msg;
  const UpdateError({
    required this.msg,
  });
}
