// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoyo/core/constants/constant.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import 'package:yoyo/presentation/widgets/customs/icons/icon_button.dart';

import '../../../../core/utils/custom_functions.dart';
import '../../customs/text.dart';

class EpisodeContainer extends StatelessWidget {
  final EpisodeEntity episode;
  final VoidCallback? onTap;
  final String? subtitle;
  final bool? haveDesc;
  final String? duration;
  final String? willContinueAt;
  const EpisodeContainer({
    Key? key,
    required this.episode,
    this.onTap,
    this.subtitle,
    this.haveDesc = true,
    this.duration,
    this.willContinueAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.paddingB1,
      child: Container(
        margin: AppDimens.paddingR1,
        width: 38.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.minRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.minRadius),
                  child: SizedBox(
                    height: 13.h,
                    width: 40.w,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: episode.image,
                          height: 12.5.h,
                          width: 40.w,
                          fit: BoxFit.cover,
                        ),
                        if (duration != null && willContinueAt != null)
                          LinearPercentIndicator(
                            animation: true,
                            backgroundColor: AppTheme.transparent,
                            restartAnimation: true,
                            animateFromLastPercent: true,
                            padding: EdgeInsets.zero,
                            lineHeight: 0.5.h,
                            clipLinearGradient: true,
                            progressColor: Theme.of(context).primaryColor,
                            percent: CustomFunctions.getLastWatchedDuration(
                              durationS: CustomFunctions.parseDuration(
                                  willContinueAt!),
                              durationL:
                                  CustomFunctions.parseDuration(duration!),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomIconButton(
                    onTap: onTap,
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      color: AppTheme.white,
                    ),
                    radius: AppDimens.maxRadius,
                    glow: true,
                  ),
                ),
              ],
            ),
            CustomText(
              episode.title != null
                  ? '${episode.number}. ${episode.title}'
                  : '${episode.number}. Episode ${episode.number}',
              size: 16.sp,
              weight: FontWeight.w600,
              maxLines: 1,
            ),
            if (subtitle != null)
              CustomText(
                subtitle,
                size: 15.sp,
                color: Theme.of(context).primaryColor,
                maxLines: 1,
              ),
            if (episode.description != null && (haveDesc ?? true))
              CustomText(
                episode.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                size: 14.sp,
              ),
          ],
        ),
      ),
    );
  }
}
