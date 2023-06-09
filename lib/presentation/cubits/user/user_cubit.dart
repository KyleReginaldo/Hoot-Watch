// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/domain/entity/user_entity.dart';
import 'package:yoyo/domain/usecases/firestore/update_user.dart';
import 'package:yoyo/domain/usecases/storage/get_download_url.dart';

import '../../../domain/usecases/firestore/fetch_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this.fetchUser,
    this.updateUser,
    this.getDownloadUrl,
  ) : super(UserInitial());

  final FetchUser fetchUser;
  final UpdateUser updateUser;
  final GetDownloadUrl getDownloadUrl;

  void onFetchUser({required String uid}) async {
    emit(FetchingUser());
    final either = await fetchUser(uid: uid);
    either.fold(
        (l) => emit(UserError(msg: l.msg)), (r) => emit(UserFetched(user: r)));
  }

  Future<void> onUpdateUser({
    required UpdateUserDto updateUserDto,
    String? path,
  }) async {
    if (path != null) {
      updateUserDto.imageLink = await getDownloadUrl(path: path);
    }
    await updateUser(
      updateUserDto: updateUserDto,
    );
  }
}
