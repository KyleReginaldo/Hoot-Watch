// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'random_cubit.dart';

abstract class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object> get props => [];
}

class RandomInitial extends RandomState {}

class RandomLoading extends RandomState {}

class RandomLoaded extends RandomState {
  final RandomEntity random;
  const RandomLoaded({
    required this.random,
  });
}

class RandomError extends RandomState {}
