part of 'popular_cubit.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoaded extends PopularState {
  final PopularEntity popular;
  const PopularLoaded({
    required this.popular,
  });
}

class PopularLoading extends PopularState {}

class PopularError extends PopularState {
  final String msg;
  const PopularError({
    required this.msg,
  });
}
