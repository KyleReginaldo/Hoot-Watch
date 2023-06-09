// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:extended_betterplayer/better_player.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoyo/core/constants/constant.dart';
import 'package:yoyo/core/utils/custom_functions.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import 'package:yoyo/domain/entity/streamlink_entity.dart';
import 'package:yoyo/presentation/cubits/common/fullscreen_cubit.dart';
import 'package:yoyo/presentation/cubits/common/playing_cubit.dart';
import 'package:yoyo/presentation/cubits/streamlink/streamlink_cubit.dart';
import 'package:yoyo/presentation/widgets/components/info/episode_container.dart';
import 'package:yoyo/presentation/widgets/customs/icons/icon_button.dart';
import 'package:yoyo/presentation/widgets/customs/text.dart';

import '../../../domain/entity/last_watched_entity.dart';

@RoutePage<LastWatchedEntity>()
class StreamingScreen extends StatefulWidget {
  final String animeId;
  final String episodeId;
  final String image;
  final ContinueAtEntity? willContinueAt;
  final List<EpisodeEntity> episodes;
  final String title;
  final int? episodeNumber;
  final bool fromInfo;
  const StreamingScreen({
    Key? key,
    required this.animeId,
    required this.episodeId,
    required this.image,
    this.willContinueAt,
    required this.episodes,
    required this.title,
    this.episodeNumber,
    required this.fromInfo,
  }) : super(key: key);

  @override
  State<StreamingScreen> createState() => _StreamingScreenState();
}

class _StreamingScreenState extends State<StreamingScreen> {
  BetterPlayerController? betterController;
  LastWatchedEntity? lastWatched;
  late List<StreamLinkEntity> streamlinks;

  @override
  void initState() {
    context.read<StreamlinkCubit>().onFetchStreamLinks(
          widget.episodeId,
          episodeNumber: widget.episodeNumber,
        );
    context.read<PlayingCubit>().setId(widget.episodeId);
    for (var element in widget.episodes) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isFullscreen = context.select((FullscreenCubit fs) => fs.state);
        final givenId = context.select((PlayingCubit pl) => pl.state);
        return WillPopScope(
          onWillPop: () async {
            context.router.popForced(lastWatched);
            return false;
          },
          child: Scaffold(
            appBar: isFullscreen
                ? null
                : AppBar(
                    title: DefaultTextStyle(
                      style: const TextStyle().copyWith(
                        fontSize: 14.sp,
                        fontFamily: 'NetflixSans',
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            widget.title,
                            speed: const Duration(milliseconds: 60),
                          ),
                        ],
                      ),
                    ),
                    leading: CustomIconButton(
                      onTap: () {
                        if (context.router.canPop()) {
                          context.router.pop<LastWatchedEntity>(lastWatched);
                        }
                      },
                      glow: true,
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<StreamlinkCubit, StreamlinkState>(
                  listener: (context, state) {
                    if (state is StreamlinkLoaded) {
                      betterController = BetterPlayerController(
                        betterPlayerPlaylistConfiguration:
                            const BetterPlayerPlaylistConfiguration(),
                        BetterPlayerConfiguration(
                          autoPlay: true,
                          autoDetectFullscreenDeviceOrientation: true,
                          startAt: widget.willContinueAt?.id == state.id
                              ? CustomFunctions.parseDuration(
                                  widget.willContinueAt?.willContinueAt ?? '0',
                                )
                              : null,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            loadingColor: Theme.of(context).primaryColor,
                            progressBarPlayedColor:
                                Theme.of(context).primaryColor,
                            progressBarBufferedColor: AppTheme.grey,
                            playerTheme: Platform.isIOS
                                ? BetterPlayerTheme.cupertino
                                : BetterPlayerTheme.material,
                          ),
                          eventListener: (BetterPlayerEvent event) {
                            if (event.betterPlayerEventType ==
                                BetterPlayerEventType.progress) {
                              if (betterController != null) {
                                lastWatched = LastWatchedEntity(
                                  episodeId: state.id,
                                  image: widget.image,
                                  animeId: widget.animeId,
                                  updatedAt: DateTime.now().toString(),
                                  title: widget.title,
                                  episodeNumber: state.episodeNumber,
                                  continueAt: ContinueAtEntity(
                                    id: state.id,
                                    willContinueAt: betterController!
                                            .videoPlayerController
                                            ?.value
                                            .position
                                            .toString() ??
                                        const Duration().toString(),
                                  ),
                                  duration: betterController!
                                          .videoPlayerController?.value.duration
                                          .toString() ??
                                      '',
                                );
                              }
                            }
                            if (event.betterPlayerEventType ==
                                BetterPlayerEventType.pause) {
                              if (betterController != null) {
                                lastWatched = LastWatchedEntity(
                                  episodeId: state.id,
                                  image: widget.image,
                                  animeId: widget.animeId,
                                  updatedAt: DateTime.now().toString(),
                                  title: widget.title,
                                  episodeNumber: state.episodeNumber,
                                  continueAt: ContinueAtEntity(
                                    id: state.id,
                                    willContinueAt: betterController!
                                            .videoPlayerController
                                            ?.value
                                            .position
                                            .toString() ??
                                        const Duration().toString(),
                                  ),
                                  duration: betterController!
                                          .videoPlayerController?.value.duration
                                          .toString() ??
                                      '',
                                );
                              }
                            }
                          },
                          // fullScreenByDefault: true,
                        ),
                        betterPlayerDataSource: BetterPlayerDataSource(
                          BetterPlayerDataSourceType.network,
                          state.streamLink
                              .sources[state.streamLink.sources.length - 2].url,
                          resolutions: {
                            "360p": state.streamLink.sources[0].url,
                            "480p": state.streamLink.sources[1].url,
                            "720p": state.streamLink.sources[2].url,
                            "1080p": state.streamLink.sources[3].url,
                          },
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is StreamlinkLoaded) {
                      return BetterPlayer(
                        controller: betterController!,
                      );
                    } else if (state is StreamlinkLoading) {
                      return FadeShimmer(
                        height: 27.h,
                        width: 100.w,
                        highlightColor: AppTheme.greyDark2,
                        baseColor: AppTheme.greyDark3,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                if (!isFullscreen)
                  Padding(
                    padding: AppDimens.paddingL1,
                    child: CustomText(
                      CustomFunctions.getPlayingEpisode(
                                  givenId ?? '', widget.episodes)
                              .title ??
                          'episode ${CustomFunctions.getPlayingEpisode(givenId ?? '', widget.episodes).number.toString()}',
                      size: 20.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                if (CustomFunctions.getPlayingEpisode(
                                givenId ?? '', widget.episodes)
                            .description !=
                        null &&
                    !isFullscreen)
                  Padding(
                    padding: AppDimens.paddingL1,
                    child: ReadMoreText(
                      CustomFunctions.removeTags(
                          CustomFunctions.getPlayingEpisode(
                                      givenId ?? '', widget.episodes)
                                  .description ??
                              ''),
                      trimLines: 3,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      moreStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                if (!isFullscreen)
                  const Divider(
                    color: AppTheme.greyDark1,
                  ),
                if (!isFullscreen)
                  Padding(
                    padding: AppDimens.paddingL1,
                    child: const CustomText('EPISODES'),
                  ),
                // BetterPlayerPlaylist(
                //   betterPlayerConfiguration: const BetterPlayerConfiguration(),
                //   betterPlayerDataSourceList: widget.episodes.map((e) {
                //     context.read<FastLinkCubit>().onInitLink(id: e.id);
                //     return BlocBuilder(builder: (context, state) {},);
                //   }).toList(),
                //   betterPlayerPlaylistConfiguration:
                //       const BetterPlayerPlaylistConfiguration(),
                // ),
                if (!isFullscreen)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(left: 1.h, right: 1.h, top: 1.h),
                      key: const PageStorageKey<String>('streamingPage'),
                      children: widget.episodes.map((e) {
                        return EpisodeContainer(
                          haveDesc: false,
                          onTap: e.id == givenId
                              ? null
                              : () {
                                  context
                                      .read<StreamlinkCubit>()
                                      .onFetchStreamLinks(e.id,
                                          episodeNumber: e.number);
                                  context.read<PlayingCubit>().setId(e.id);
                                },
                          episode: e,
                          subtitle: e.id == givenId ? 'Playing...' : null,
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
