// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_cubit.dart';

abstract class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

class StorageInitial extends StorageState {}

class StorageLoading extends StorageState {}

class StorageDone extends StorageState {
  final String? path;
  const StorageDone({
    this.path,
  });
}
