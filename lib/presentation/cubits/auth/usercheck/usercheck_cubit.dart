// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/usecases/auth/userchanges.dart';

part 'usercheck_state.dart';

class UsercheckCubit extends Cubit<UsercheckState> {
  UsercheckCubit(
    this.userchanges,
  ) : super(UsercheckInitial());

  final Userchanges userchanges;

  void checkUserchanges() {
    final user = userchanges();
    user.listen((user) {
      if (user != null) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    });
  }
}
