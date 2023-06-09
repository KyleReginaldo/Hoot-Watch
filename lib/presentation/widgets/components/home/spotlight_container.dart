import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/core/constants/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/core/constants/svg_icon.dart';
import 'package:yoyo/core/router/custom_router.dart';
import 'package:yoyo/core/utils/custom_functions.dart';
import 'package:yoyo/presentation/cubits/common/color_cubit.dart';
import 'package:yoyo/presentation/widgets/customs/button/elevated_icon_button.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../cubits/spotlight/spotlight_cubit.dart';

class SpotlightContainer extends StatelessWidget {
  const SpotlightContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final bgColor = context.select((ColorCubit clr) => clr.state);
        return BlocConsumer<SpotlightCubit, SpotlightState>(
          listener: (context, state) {
            if (state is SpotlightLoaded) {
              context.read<ColorCubit>().pickColor(
                    Color(
                      CustomFunctions.convertHexToInt(
                        state.spotlight.trending.results.first.color ??
                            '#FE0202',
                      ),
                    ),
                  );
            }
          },
          builder: (context, state) {
            if (state is SpotlightLoaded) {
              return Container(
                padding: AppDimens.paddingT10,
                margin: AppDimens.paddingB2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      bgColor.withOpacity(0.3),
                      bgColor.withOpacity(0.4),
                      bgColor.withOpacity(0.5),
                      bgColor.withOpacity(0.6),
                      bgColor.withOpacity(0.5),
                      bgColor.withOpacity(0.4),
                      bgColor.withOpacity(0.3),
                      bgColor.withOpacity(0.2),
                      bgColor.withOpacity(0.1),
                      bgColor.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: CarouselSlider(
                  items: [
                    ...state.spotlight.trending.results.map((e) {
                      return Padding(
                        padding: AppDimens.paddingH4,
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: e.image,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: 20.h,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomElevatedIconButton(
                                      title: 'Bookmark',
                                      icon: SvgPicture.asset(
                                        SvgIcon.add,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      bgColor: AppTheme.greyDark3,
                                    ),
                                    SizedBox(width: 4.w),
                                    CustomElevatedIconButton(
                                      title: 'Play',
                                      icon: SvgPicture.asset(
                                        SvgIcon.info,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      bgColor: AppTheme.greyDark3,
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .push(InfoRoute(id: e.id));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    ...state.spotlight.upcoming.results.map((e) {
                      return Padding(
                        padding: AppDimens.paddingH4,
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: e.image,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: 20.h,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomElevatedIconButton(
                                      title: 'Bookmark',
                                      icon: SvgPicture.asset(
                                        SvgIcon.add,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      bgColor: AppTheme.greyDark3,
                                    ),
                                    SizedBox(width: 4.w),
                                    CustomElevatedIconButton(
                                      title: 'Upcoming',
                                      icon: SvgPicture.asset(
                                        SvgIcon.info,
                                        color: AppTheme.grey,
                                      ),
                                      bgColor: AppTheme.greyDark3,
                                      onTap: null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList()
                  ],
                  options: CarouselOptions(
                    height: 40.h,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    disableCenter: false,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      if (index < state.spotlight.trending.results.length) {
                        context.read<ColorCubit>().pickColor(
                              Color(
                                CustomFunctions.convertHexToInt(
                                  state.spotlight.trending.results[index]
                                          .color ??
                                      '#000000',
                                ),
                              ),
                            );
                      } else if (index >=
                              state.spotlight.trending.results.length &&
                          index <
                              (state.spotlight.upcoming.results.length +
                                  state.spotlight.trending.results.length)) {
                        context.read<ColorCubit>().pickColor(
                              Color(
                                CustomFunctions.convertHexToInt(
                                  state
                                          .spotlight
                                          .upcoming
                                          .results[index -
                                              state.spotlight.trending.results
                                                  .length]
                                          .color ??
                                      '#000000',
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ),
              );
            } else if (state is SpotlightLoading) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: AppDimens.padding1,
                            child: FadeShimmer(
                              width: 100.w,
                              height: 25.h,
                              radius: 8,
                              highlightColor: AppTheme.black,
                              baseColor: AppTheme.greyDark2,
                            ),
                          )),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
