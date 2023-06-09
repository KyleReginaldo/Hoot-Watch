// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'spotlight_cubit.dart';

abstract class SpotlightState extends Equatable {
  const SpotlightState();

  @override
  List<Object> get props => [];
}

class SpotlightInitial extends SpotlightState {}

class SpotlightLoaded extends SpotlightState {
  final SpotlightEntity spotlight;
  const SpotlightLoaded({
    required this.spotlight,
  });
}

class SpotlightLoading extends SpotlightState {}

class SpotlightError extends SpotlightState {
  final String msg;
  const SpotlightError({
    required this.msg,
  });
}
