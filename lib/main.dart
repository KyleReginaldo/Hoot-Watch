import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/core/router/custom_router.dart';
import 'package:yoyo/data/model/popular_model.dart';
import 'package:yoyo/data/model/random_model.dart';
import 'package:yoyo/data/model/title_model.dart';
import 'package:yoyo/data/model/trending_model.dart';
import 'package:yoyo/data/model/upcoming_model.dart';
import 'package:yoyo/dependency.dart';
import 'package:yoyo/presentation/cubits/common/carousel_title_cubit.dart';
import 'package:yoyo/presentation/cubits/common/color_cubit.dart';
import 'package:yoyo/presentation/cubits/common/fast_link_cubit.dart';
import 'package:yoyo/presentation/cubits/common/scroll_cubit.dart';
import 'package:yoyo/presentation/cubits/common/sort_by_date_cubit.dart';
import 'package:yoyo/presentation/cubits/common/theme_picker_cubit.dart';
import 'package:yoyo/presentation/cubits/common/watched_eps_cubit.dart';
import 'package:yoyo/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:yoyo/presentation/cubits/favorite/is_favorite_cubit.dart';
import 'package:yoyo/presentation/cubits/popular/popular_cubit.dart';

import 'core/constants/app_theme.dart';
import 'core/constants/constant.dart';
import 'data/model/recent_release_model.dart';
import 'firebase_options.dart';
import 'presentation/cubits/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  await Hive.initFlutter();
  Hive.registerAdapter(RandomModelAdapter());
  Hive.registerAdapter(TitleModelAdapter());
  Hive.registerAdapter(TrendingModelAdapter());
  Hive.registerAdapter(TrendingResultModelAdapter());
  Hive.registerAdapter(RecentReleaseModelAdapter());
  Hive.registerAdapter(RecentResultModelAdapter());
  Hive.registerAdapter(UpcomingModelAdapter());
  Hive.registerAdapter(UpcomingResultModelAdapter());
  Hive.registerAdapter(PopularModelAdapter());
  Hive.registerAdapter(PopularResultModelAdapter());
  await Hive.openBox('random_test');
  await Hive.openBox('trending_test');
  await Hive.openBox('recent_test');
  await Hive.openBox('upcoming_test');
  await Hive.openBox('popular_test');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => sl<RecentCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<InfoCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<StreamlinkCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<UsercheckCubit>()..checkUserchanges(),
        ),
        BlocProvider(
          create: (ctx) => sl<AuthenticationCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<UserCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<UserFnCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<StorageCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => sl<LastWatchedCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<RandomCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<CurrentUserCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<FavoriteCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<LastwatchCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<PopularCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<SpotlightCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<WatchedEpsCubit>(),
        ),
        BlocProvider(
          create: (ctx) => sl<FastLinkCubit>(),
        ),
        BlocProvider(
          create: (ctx) => IsFavoriteCubit(),
        ),
        BlocProvider(
          create: (ctx) => SearchbarCubit(),
        ),
        BlocProvider(
          create: (ctx) => BnbCubit(),
        ),
        BlocProvider(
          create: (ctx) => FullscreenCubit(),
        ),
        BlocProvider(
          create: (ctx) => EpisodesCubit(),
        ),
        BlocProvider(
          create: (ctx) => ImageCubit(),
        ),
        BlocProvider(
          create: (ctx) => PlayingCubit(),
        ),
        BlocProvider(
          create: (ctx) => InfoswitchCubit(),
        ),
        BlocProvider(
          create: (ctx) => CarouselTitleCubit(),
        ),
        BlocProvider(
          create: (ctx) => ScrollCubit(),
        ),
        BlocProvider(
          create: (ctx) => ColorCubit(),
        ),
        BlocProvider(
          create: (ctx) => ThemePickerCubit(),
        ),
        BlocProvider(
          create: (ctx) => SortByDateCubit(),
        ),
      ],
      child: ResponsiveSizer(builder: (p0, p1, p2) {
        return Builder(
          builder: (context) {
            final themePicked =
                context.select((ThemePickerCubit theme) => theme.state);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              title: 'HootWatch',
              theme: ThemeData(
                scaffoldBackgroundColor: AppTheme.black,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    iconColor:
                        MaterialStatePropertyAll(themePicked.primaryColor),
                  ),
                ),
                progressIndicatorTheme: ProgressIndicatorThemeData(
                  color: themePicked.primaryColor,
                ),
                textTheme: AppTheme.textTheme,
                brightness: Brightness.dark,
                useMaterial3: true,
                primaryColor: themePicked.primaryColor,
                fontFamily: 'NetflixSans',
              ),
            );
          },
        );
      }),
    );
  }
}
