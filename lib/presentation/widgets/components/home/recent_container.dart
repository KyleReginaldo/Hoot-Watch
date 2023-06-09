import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/core/constants/app_theme.dart';
import 'package:yoyo/core/router/custom_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/custom_functions.dart';
import '../../../cubits/recent/recent_cubit.dart';
import '../../customs/ani_container.dart';
import '../../customs/text.dart';

class RecentContainer extends StatelessWidget {
  const RecentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentCubit, RecentState>(
      builder: (context, state) {
        if (state is RecentLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.recent.results.isNotEmpty) SizedBox(height: 2.h),
              if (state.recent.results.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: CustomText(
                    'Recently added',
                    size: 16.sp,
                    weight: FontWeight.bold,
                    color: AppTheme.greyLight3,
                  ),
                ),
              if (state.recent.results.isNotEmpty) SizedBox(height: 0.5.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.recent.results.map((e) {
                    return CustomAniContainer(
                      width: 28.w,
                      height: 18.h,
                      image: e.image,
                      padding: EdgeInsets.only(left: 1.h),
                      color: Color(CustomFunctions.convertHexToInt(
                        e.color ?? '#000000',
                      )),
                      onTap: () {
                        AutoRouter.of(context).push(InfoRoute(
                          id: e.id,
                          color: Color(CustomFunctions.convertHexToInt(
                            e.color ?? '#000000',
                          )),
                        ));
                      },
                      title: e.title.english ??
                          e.title.userPreferred ??
                          e.title.romaji,
                      size: 13.sp,
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else if (state is RecentLoading) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  8,
                  (index) => Padding(
                        padding: EdgeInsets.all(1.h),
                        child: FadeShimmer(
                          width: 24.w,
                          height: 16.h,
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
  }
}
