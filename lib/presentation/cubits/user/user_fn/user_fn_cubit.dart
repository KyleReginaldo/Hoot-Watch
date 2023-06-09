// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/user_entity.dart';
import 'package:yoyo/domain/usecases/firestore/setup_user.dart';
import 'package:yoyo/domain/usecases/storage/get_download_url.dart';

part 'user_fn_state.dart';

class UserFnCubit extends Cubit<UserFnState> {
  UserFnCubit(
    this.setupUser,
    this.getDownloadUrl,
  ) : super(UserFnInitial());

  final SetupUser setupUser;
  final GetDownloadUrl getDownloadUrl;

  Future<void> onSetupUser({required UserEntity user, String? path}) async {
    emit(Updating());
    final either = await setupUser(
        user: user,
        dlUrl: path != null ? await getDownloadUrl(path: path) : null);
    either.fold(
        (l) => emit(UpdateError(msg: l.msg)), (r) => emit(UpdateDone()));
  }
}
