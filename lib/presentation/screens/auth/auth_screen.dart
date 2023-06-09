import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/presentation/cubits/auth/usercheck/usercheck_cubit.dart';
import 'package:yoyo/presentation/screens/auth/login_screen.dart';
import 'package:yoyo/presentation/screens/main_screen.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsercheckCubit, UsercheckState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const MainScreen();
        } else if (state is UnAuthenticated) {
          return const LoginScreen();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    );
  }
}
