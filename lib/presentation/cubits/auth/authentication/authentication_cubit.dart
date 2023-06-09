// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/core/dtos/auth_dto.dart';

import 'package:yoyo/domain/usecases/auth/login.dart';
import 'package:yoyo/domain/usecases/auth/signup.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.login,
    this.signup,
  ) : super(AuthenticationInitial());

  final Login login;
  final Signup signup;

  void onLogin({required AuthDto authDto}) async {
    emit(LoggingIn());
    final either = await login(authDto: authDto);
    either.fold((l) => emit(LogInError(msg: l.msg)), (r) => emit(LoggedIn()));
  }

  void onSignup({required AuthDto authDto}) async {
    emit(SigningUp());
    final either = await signup(authDto: authDto);
    either.fold((l) => emit(SignUpError(msg: l.msg)), (r) => emit(SignedUp()));
  }
}
