part of 'usercheck_cubit.dart';

abstract class UsercheckState extends Equatable {
  const UsercheckState();

  @override
  List<Object> get props => [];
}

class UsercheckInitial extends UsercheckState {}

class Authenticated extends UsercheckState {}

class UnAuthenticated extends UsercheckState {}
