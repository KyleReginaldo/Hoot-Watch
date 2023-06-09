// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/auth/fetch_fb_user.dart';

class CurrentUserCubit extends Cubit<User?> {
  CurrentUserCubit(
    this.fetchFbUser,
  ) : super(null);

  final FetchFbUser fetchFbUser;

  void onFetchFbUser() {
    final user = fetchFbUser();
    emit(user);
  }
}
