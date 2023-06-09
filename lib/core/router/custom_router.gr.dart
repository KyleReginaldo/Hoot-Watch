// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'custom_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InfoScreen(
          key: args.key,
          id: args.id,
          tab: args.tab,
          color: args.color,
        ),
      );
    },
    StreamingRoute.name: (routeData) {
      final args = routeData.argsAs<StreamingRouteArgs>();
      return AutoRoutePage<LastWatchedEntity>(
        routeData: routeData,
        child: StreamingScreen(
          key: args.key,
          animeId: args.animeId,
          episodeId: args.episodeId,
          image: args.image,
          willContinueAt: args.willContinueAt,
          episodes: args.episodes,
          title: args.title,
          episodeNumber: args.episodeNumber,
          fromInfo: args.fromInfo,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required UserEntity user,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final UserEntity user;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<InfoRouteArgs> {
  InfoRoute({
    Key? key,
    required String id,
    int? tab,
    Color? color,
    List<PageRouteInfo>? children,
  }) : super(
          InfoRoute.name,
          args: InfoRouteArgs(
            key: key,
            id: id,
            tab: tab,
            color: color,
          ),
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<InfoRouteArgs> page = PageInfo<InfoRouteArgs>(name);
}

class InfoRouteArgs {
  const InfoRouteArgs({
    this.key,
    required this.id,
    this.tab,
    this.color,
  });

  final Key? key;

  final String id;

  final int? tab;

  final Color? color;

  @override
  String toString() {
    return 'InfoRouteArgs{key: $key, id: $id, tab: $tab, color: $color}';
  }
}

/// generated route for
/// [StreamingScreen]
class StreamingRoute extends PageRouteInfo<StreamingRouteArgs> {
  StreamingRoute({
    Key? key,
    required String animeId,
    required String episodeId,
    required String image,
    ContinueAtEntity? willContinueAt,
    required List<EpisodeEntity> episodes,
    required String title,
    int? episodeNumber,
    required bool fromInfo,
    List<PageRouteInfo>? children,
  }) : super(
          StreamingRoute.name,
          args: StreamingRouteArgs(
            key: key,
            animeId: animeId,
            episodeId: episodeId,
            image: image,
            willContinueAt: willContinueAt,
            episodes: episodes,
            title: title,
            episodeNumber: episodeNumber,
            fromInfo: fromInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'StreamingRoute';

  static const PageInfo<StreamingRouteArgs> page =
      PageInfo<StreamingRouteArgs>(name);
}

class StreamingRouteArgs {
  const StreamingRouteArgs({
    this.key,
    required this.animeId,
    required this.episodeId,
    required this.image,
    this.willContinueAt,
    required this.episodes,
    required this.title,
    this.episodeNumber,
    required this.fromInfo,
  });

  final Key? key;

  final String animeId;

  final String episodeId;

  final String image;

  final ContinueAtEntity? willContinueAt;

  final List<EpisodeEntity> episodes;

  final String title;

  final int? episodeNumber;

  final bool fromInfo;

  @override
  String toString() {
    return 'StreamingRouteArgs{key: $key, animeId: $animeId, episodeId: $episodeId, image: $image, willContinueAt: $willContinueAt, episodes: $episodes, title: $title, episodeNumber: $episodeNumber, fromInfo: $fromInfo}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
