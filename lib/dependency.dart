import 'package:get_it/get_it.dart';
import 'package:yoyo/data/datasource/local/local_datasource.dart';
import 'package:yoyo/data/datasource/local/local_datasource_impl.dart';
import 'package:yoyo/data/datasource/remote/remote_datasource.dart';
import 'package:yoyo/data/datasource/remote/remote_datasource_impl.dart';
import 'package:yoyo/data/repository/repository.dart';
import 'package:yoyo/domain/repository/repository.dart';
import 'package:yoyo/domain/usecases/auth/fetch_fb_user.dart';
import 'package:yoyo/domain/usecases/auth/userchanges.dart';
import 'package:yoyo/domain/usecases/fetch_anime_info.dart';
import 'package:yoyo/domain/usecases/fetch_random_anime.dart';
import 'package:yoyo/domain/usecases/fetch_recent_anime.dart';
import 'package:yoyo/domain/usecases/fetch_spotlight.dart';
import 'package:yoyo/domain/usecases/fetch_stream_links.dart';
import 'package:yoyo/domain/usecases/firestore/add_favorite.dart';
import 'package:yoyo/domain/usecases/firestore/check_lastwatch.dart';
import 'package:yoyo/domain/usecases/firestore/fetch_favorites.dart';
import 'package:yoyo/domain/usecases/firestore/fetch_last_watched.dart';
import 'package:yoyo/domain/usecases/firestore/fetch_user.dart';
import 'package:yoyo/domain/usecases/firestore/remove_favorite.dart';
import 'package:yoyo/domain/usecases/firestore/save_last_watched.dart';
import 'package:yoyo/domain/usecases/firestore/update_user.dart';
import 'package:yoyo/domain/usecases/search_anime.dart';
import 'package:yoyo/domain/usecases/storage/get_download_url.dart';
import 'package:yoyo/domain/usecases/storage/upload_image.dart';
import 'package:yoyo/presentation/cubits/common/fast_link_cubit.dart';
import 'package:yoyo/presentation/cubits/common/watched_eps_cubit.dart';
import 'package:yoyo/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:yoyo/presentation/cubits/popular/popular_cubit.dart';
import 'package:yoyo/presentation/cubits/state.dart';

import 'domain/usecases/auth/login.dart';
import 'domain/usecases/auth/signup.dart';
import 'domain/usecases/fetch_popular_anime.dart';
import 'domain/usecases/firestore/last_watched_eps.dart';
import 'domain/usecases/firestore/setup_user.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => RecentCubit(sl()));
  sl.registerFactory(() => InfoCubit(sl()));
  sl.registerFactory(() => StreamlinkCubit(sl()));
  sl.registerFactory(() => UsercheckCubit(sl()));
  sl.registerFactory(() => AuthenticationCubit(sl(), sl()));
  sl.registerFactory(() => UserCubit(sl(), sl(), sl()));
  sl.registerFactory(() => UserFnCubit(sl(), sl()));
  sl.registerFactory(() => StorageCubit(sl()));
  sl.registerFactory(() => SearchBloc(sl()));
  sl.registerFactory(() => LastWatchedCubit(sl(), sl()));
  sl.registerFactory(() => RandomCubit(sl()));
  sl.registerFactory(() => CurrentUserCubit(sl()));
  sl.registerFactory(() => FavoriteCubit(sl(), sl(), sl()));
  sl.registerFactory(() => LastwatchCubit(sl()));
  sl.registerFactory(() => PopularCubit(sl()));
  sl.registerFactory(() => SpotlightCubit(sl()));
  sl.registerFactory(() => WatchedEpsCubit(sl()));
  sl.registerFactory(() => FastLinkCubit(sl()));

  sl.registerLazySingleton(() => FetchRecentAnime(repo: sl()));
  sl.registerLazySingleton(() => FetchAnimeInfo(repo: sl()));
  sl.registerLazySingleton(() => FetchStreamLinks(repo: sl()));
  sl.registerLazySingleton(() => Userchanges(repo: sl()));
  sl.registerLazySingleton(() => Login(repo: sl()));
  sl.registerLazySingleton(() => Signup(repo: sl()));
  sl.registerLazySingleton(() => FetchUser(repo: sl()));
  sl.registerLazySingleton(() => SetupUser(repo: sl()));
  sl.registerLazySingleton(() => UploadImage(repo: sl()));
  sl.registerLazySingleton(() => GetDownloadUrl(repo: sl()));
  sl.registerLazySingleton(() => SearchAnime(repo: sl()));
  sl.registerLazySingleton(() => SaveLastWatched(repo: sl()));
  sl.registerLazySingleton(() => FetchLastWatched(repo: sl()));
  sl.registerLazySingleton(() => FetchRandomAnime(repo: sl()));
  sl.registerLazySingleton(() => FetchFbUser(repo: sl()));
  sl.registerLazySingleton(() => AddFavorite(repo: sl()));
  sl.registerLazySingleton(() => FetchFavorites(repo: sl()));
  sl.registerLazySingleton(() => RemoveFavorite(repo: sl()));
  sl.registerLazySingleton(() => CheckLastwatch(repo: sl()));
  sl.registerLazySingleton(() => UpdateUser(repo: sl()));
  sl.registerLazySingleton(() => FetchPopularAnime(repo: sl()));
  sl.registerLazySingleton(() => FetchSpotlight(repo: sl()));
  sl.registerLazySingleton(() => LastWatchEdEps(repo: sl()));

  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remote: sl(), local: sl()));
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDsatasourceImpl());
  sl.registerLazySingleton<LocalDatasource>(() => LocalDatasourceImpl());
}
