part of 'recent_cubit.dart';

abstract class RecentState {}

class RecentInitial extends RecentState {}

class RecentLoaded extends RecentState {
  final RecentReleaseEntity recent;
  RecentLoaded({
    required this.recent,
  });
}

class RecentLoading extends RecentState {}

class RecentError extends RecentState {
  final String msg;
  RecentError({
    required this.msg,
  });
}
