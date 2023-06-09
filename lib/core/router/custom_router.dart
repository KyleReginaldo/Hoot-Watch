import 'package:flutter/material.dart';
import 'package:yoyo/presentation/screens/auth/login_screen.dart';
import 'package:yoyo/presentation/screens/extension/edit_profile_screen.dart';
import 'package:yoyo/presentation/screens/extension/info_screen.dart';
import 'package:yoyo/presentation/screens/extension/streaming_screen.dart';
import 'package:yoyo/presentation/screens/main_screen.dart';
import 'package:auto_route/auto_route.dart';
import '../../domain/entity/info_entity.dart';
import '../../domain/entity/last_watched_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/auth/signup_screen.dart';
import '../../presentation/screens/extension/account_screen.dart';
part 'custom_router.gr.dart';

// extend the generated private router
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
        ),
        CustomRoute(
          page: InfoRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        AutoRoute(
          page: MainRoute.page,
        ),
        CustomRoute(
          page: StreamingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: SignupRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: AccountRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: EditProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
      ];
}
