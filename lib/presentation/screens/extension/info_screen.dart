// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:duration/duration.dart';
import 'package:yoyo/core/utils/custom_functions.dart';
import 'package:yoyo/domain/entity/favorite_entity.dart';
import 'package:yoyo/presentation/cubits/common/sort_by_date_cubit.dart';
import 'package:yoyo/presentation/cubits/common/watched_eps_cubit.dart';
import 'package:yoyo/presentation/cubits/favorite/is_favorite_cubit.dart';
import 'package:yoyo/presentation/cubits/state.dart';
import 'package:yoyo/presentation/widgets/customs/button/elevated_icon_button.dart';
import 'package:yoyo/presentation/widgets/customs/text.dart';

import '../../../core/constants/constant.dart';
import '../../../core/router/custom_router.dart';
import '../../../domain/entity/last_watched_entity.dart';
import '../../cubits/favorite/favorite_cubit.dart';
import '../../widgets/components/info/episode_container.dart';
import '../../widgets/customs/icons/icon_button.dart';

@RoutePage()
class InfoScreen extends StatefulWidget {
  final String id;
  final int? tab;
  final Color? color;
  const InfoScreen({
    Key? key,
    required this.id,
    this.tab,
    this.color,
  }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    context.read<InfoCubit>().onFetchAnimeInfo(widget.id);
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    context.read<InfoswitchCubit>().switchTab(0);
    context.read<IsFavoriteCubit>().isFavorite(
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          animeId: widget.id,
        );
    // context.read<LastwatchCubit>().onCheckLastWatch(
    //       userId: FirebaseAuth.instance.currentUser?.uid ?? '',
    //       episodeId: widget.id,
    //     );
    context.read<WatchedEpsCubit>().onFetchWatchedEps(
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          animeId: widget.id,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final selectedTab = context.select((InfoswitchCubit sw) => sw.state);
      final isFavorite = context.select((IsFavoriteCubit ifs) => ifs.state);
      final isLatest = context.select((SortByDateCubit sbd) => sbd.state);
      return WillPopScope(
        onWillPop: () async {
          context.read<LastWatchedCubit>().onFetchLastWatched(
              userId: FirebaseAuth.instance.currentUser?.uid ?? "");
          return true;
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: CustomIconButton(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              glow: true,
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppTheme.white,
              ),
            ),
          ),
          body: BlocConsumer<InfoCubit, InfoState>(
            listener: (context, state) {
              if (state is InfoLoaded) {
                context.read<EpisodesCubit>().addEpisodes(state.Info.episodes);
              } else if (state is InfoError) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const CustomText('Error'),
                        content: const CustomText(
                          'Server down please comeback later.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context).popUntilRoot();
                            },
                            child: const CustomText('back'),
                          ),
                          TextButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const CustomText('exit'),
                          ),
                        ],
                      );
                    });
              }
            },
            builder: (context, state) {
              if (state is InfoLoaded) {
                final info = state.Info;
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.Info.cover,
                          fit: BoxFit.cover,
                          height: 35.h,
                          width: 100.w,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 1.h, top: 4.h),
                            alignment: Alignment.bottomLeft,
                            width: 100.w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.black.withOpacity(0),
                                  AppTheme.black.withOpacity(0.1),
                                  AppTheme.black.withOpacity(0.2),
                                  AppTheme.black.withOpacity(0.3),
                                  AppTheme.black.withOpacity(0.4),
                                  AppTheme.black.withOpacity(0.5),
                                  AppTheme.black.withOpacity(0.6),
                                  AppTheme.black.withOpacity(0.7),
                                  AppTheme.black.withOpacity(0.8),
                                  AppTheme.black.withOpacity(0.9),
                                  AppTheme.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.minRadius),
                                  child: CachedNetworkImage(
                                    imageUrl: info.image,
                                    height: 16.h,
                                    width: 24.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                CustomText(
                                  info.title.english ??
                                      info.title.userPreferred ??
                                      info.title.romaji,
                                  size: 20.sp,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: AppDimens.paddingH1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomElevatedIconButton(
                            onTap: () {
                              final favorite = FavoriteEntity(
                                id: info.id,
                                malId: info.malId ?? 0,
                                image: info.image,
                                title: info.title,
                                uploadedAt: DateTime.now().toString(),
                                color: info.color,
                              );
                              if (isFavorite) {
                                context
                                    .read<FavoriteCubit>()
                                    .onRemoveFavorite(
                                      userId: FirebaseAuth
                                              .instance.currentUser?.uid ??
                                          "",
                                      animeId: info.id,
                                    )
                                    .then((value) async {
                                  context.read<IsFavoriteCubit>().isFavorite(
                                        userId: value,
                                        animeId: widget.id,
                                      );
                                });
                              } else {
                                context
                                    .read<FavoriteCubit>()
                                    .onAddFavorite(
                                      userId: FirebaseAuth
                                              .instance.currentUser?.uid ??
                                          "",
                                      favorite: favorite,
                                    )
                                    .then((value) async {
                                  context.read<IsFavoriteCubit>().isFavorite(
                                        userId: value,
                                        animeId: widget.id,
                                      );
                                });
                              }
                            },
                            title: isFavorite
                                ? 'Remove to Favorite'
                                : 'Add to Favorites',
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            bgColor: AppTheme.greyDark2,
                          ),
                          const CustomText('Genre'),
                          Wrap(
                            children: info.genres.map((genre) {
                              return CustomText(
                                  "$genre${genre == info.genres.last ? "" : " · "}");
                            }).toList(),
                          ),
                          if (info.episodes.isNotEmpty)
                            BlocBuilder<WatchedEpsCubit, WatchedEpsState>(
                              builder: (context, westate) {
                                return GestureDetector(
                                  onTap: westate is WatchedLoaded
                                      ? () async {
                                          var result =
                                              await context.router.push(
                                            StreamingRoute(
                                              animeId: westate
                                                  .lastWatched.first.animeId,
                                              episodeId: westate
                                                  .lastWatched.first.episodeId,
                                              image: westate
                                                  .lastWatched.first.image,
                                              episodes: state.Info.episodes,
                                              willContinueAt: westate
                                                  .lastWatched.first.continueAt,
                                              title: westate
                                                  .lastWatched.first.title,
                                              episodeNumber: westate.lastWatched
                                                  .first.episodeNumber,
                                              fromInfo: true,
                                            ),
                                          );
                                          if (context.mounted &&
                                              (result != null)) {
                                            context
                                                .read<LastWatchedCubit>()
                                                .onSaveLastWatched(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      '',
                                                  info: result
                                                      as LastWatchedEntity,
                                                  animeId: westate.lastWatched
                                                      .first.animeId,
                                                );
                                          }
                                        }
                                      : () async {
                                          var result =
                                              await context.router.push(
                                            StreamingRoute(
                                              episodeId: info.episodes.first.id,
                                              episodes: info.episodes,
                                              image: info.episodes.first.image,
                                              animeId: widget.id,
                                              title: info.title.english ??
                                                  info.title.userPreferred ??
                                                  info.title.romaji ??
                                                  '${info.episodes.first.number}',
                                              episodeNumber:
                                                  info.episodes.first.number,
                                              fromInfo: true,
                                            ),
                                          );
                                          if (context.mounted &&
                                              (result != null)) {
                                            context
                                                .read<LastWatchedCubit>()
                                                .onSaveLastWatched(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      '',
                                                  info: result
                                                      as LastWatchedEntity,
                                                  episodeId: state
                                                      .Info.episodes.first.id,
                                                  animeId: widget.id,
                                                );
                                          }
                                        },
                                  child: Container(
                                    height: 6.h,
                                    width: 100.w,
                                    margin: AppDimens.paddingT1,
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius: BorderRadius.circular(
                                        AppDimens.minRadius,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: AppTheme.white,
                                          offset: Offset(0, 0),
                                          blurRadius: 6,
                                          spreadRadius: 0.5,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.play_arrow,
                                          color: AppTheme.greyDark1,
                                        ),
                                        SizedBox(width: 2.w),
                                        CustomText(
                                          westate is WatchedLoaded
                                              ? 'Continue at ${printDuration(CustomFunctions.parseDuration(westate.lastWatched.first.continueAt.willContinueAt))} Ep.${westate.lastWatched.first.episodeNumber}'
                                              : state is Loading
                                                  ? 'Fetching...'
                                                  : 'Play',
                                          color: AppTheme.greyDark1,
                                          size: 16.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (info.description != null) SizedBox(height: 1.h),
                          if (info.description != null)
                            const CustomText('Synopsis'),
                          if (info.description != null)
                            ReadMoreText(
                              CustomFunctions.removeTags(
                                  "${info.description!} "),
                              trimLines: 3,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.greyLight2,
                              ),
                              moreStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.white,
                              ),
                              lessStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                    BlocListener<LastWatchedCubit, LastWatchedState>(
                      listener: (context, state) {
                        if (state is Saved) {
                          if (state.episodeId != null) {
                            context.read<LastwatchCubit>().onCheckLastWatch(
                                  userId: state.userId,
                                  episodeId: state.episodeId ?? '',
                                );
                          }
                          if (state.animeId != null) {
                            context.read<WatchedEpsCubit>().onFetchWatchedEps(
                                  userId: state.userId,
                                  animeId: state.animeId ?? '',
                                );
                          }
                        }
                      },
                      child: const SizedBox(),
                    ),
                    SizedBox(height: 1.h),
                    if (info.episodes.isNotEmpty)
                      BlocBuilder<WatchedEpsCubit, WatchedEpsState>(
                        builder: (context, wstate) {
                          return Padding(
                            padding: AppDimens.paddingH1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Episodes',
                                  size: 16.sp,
                                  weight: FontWeight.bold,
                                  color: AppTheme.greyLight3,
                                ),
                                if (info.nextAiringEpisode?.airingTime != null)
                                  CustomText(
                                    'next episode: ${DateFormat('hh:mm a, MMM dd').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        info.nextAiringEpisode?.airingTime ?? 0,
                                      ),
                                    )}',
                                    size: 14.sp,
                                  ),
                                SingleChildScrollView(
                                  padding: EdgeInsets.only(top: 0.5.h),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: info.episodes.map((episode) {
                                      List<LastWatchedEntity> ep = [];
                                      if (wstate is WatchedLoaded) {
                                        ep.addAll(wstate.lastWatched.where(
                                            (e) => e.episodeId == episode.id));
                                      }
                                      return EpisodeContainer(
                                        episode: episode,
                                        duration: ep.isNotEmpty
                                            ? ep.first.duration
                                            : null,
                                        willContinueAt: ep.isNotEmpty
                                            ? ep.first.continueAt.willContinueAt
                                            : null,
                                        onTap: () async {
                                          var result = await context.router
                                              .push<LastWatchedEntity>(
                                            StreamingRoute(
                                              episodeId: episode.id,
                                              episodes: info.episodes,
                                              image: info.image,
                                              animeId: info.id,
                                              title: info.title.english ??
                                                  info.title.userPreferred ??
                                                  info.title.romaji ??
                                                  '${episode.number}',
                                              episodeNumber: episode.number,
                                              fromInfo: true,
                                              willContinueAt: ep.isNotEmpty
                                                  ? ep.first.continueAt
                                                  : null,
                                            ),
                                          );
                                          if (context.mounted &&
                                              result != null) {
                                            context
                                                .read<LastWatchedCubit>()
                                                .onSaveLastWatched(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      '',
                                                  info: result,
                                                  episodeId: episode.id,
                                                  animeId: widget.id,
                                                );
                                          }
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    if (info.characters.isNotEmpty)
                      Padding(
                        padding: AppDimens.paddingL1,
                        child: CustomText(
                          'VA',
                          size: 16.sp,
                          weight: FontWeight.bold,
                          color: AppTheme.greyLight3,
                        ),
                      ),
                    if (info.characters.isNotEmpty)
                      Padding(
                        padding: AppDimens.paddingL1,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 0.5.h),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: info.characters.map((character) {
                              return Container(
                                width: 26.w,
                                height: 24.h,
                                margin: AppDimens.paddingR1,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        AppDimens.minRadius,
                                      ),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        height: 18.h,
                                        width: 26.w,
                                        imageUrl: character
                                                .voiceActors.isNotEmpty
                                            ? character.voiceActors.first.image
                                            : character.image,
                                      ),
                                    ),
                                    CustomText(
                                      character.voiceActors.isNotEmpty
                                          ? '${character.voiceActors.first.name.userPreferred} as ${character.name.userPreferred}'
                                          : character.name.userPreferred,
                                      textAlign: TextAlign.center,
                                      size: 14.sp,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    SizedBox(height: 4.h),
                  ],
                );
              } else if (state is InfoLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  }
}
