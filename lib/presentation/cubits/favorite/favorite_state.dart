// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorites;
  const FavoriteLoaded({
    required this.favorites,
  });
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}
