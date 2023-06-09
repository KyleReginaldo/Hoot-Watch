part of 'info_cubit.dart';

abstract class InfoState {}

class InfoInitial extends InfoState {}

class InfoLoaded extends InfoState {
  final InfoEntity Info;
  InfoLoaded({
    required this.Info,
  });
}

class InfoLoading extends InfoState {}

class InfoError extends InfoState {
  final String msg;
  InfoError({
    required this.msg,
  });
}
