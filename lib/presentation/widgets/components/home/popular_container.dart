import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/core/constants/app_theme.dart';
import 'package:yoyo/core/router/custom_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/utils/custom_functions.dart';
import '../../../cubits/popular/popular_cubit.dart';
import '../../customs/ani_container.dart';
import '../../customs/text.dart';

class PopularContainer extends StatelessWidget {
  const PopularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.popular.results.isNotEmpty) SizedBox(height: 2.h),
              if (state.popular.results.isNotEmpty)
                Padding(
                  padding: AppDimens.paddingL1,
                  child: CustomText(
                    'Popular',
                    size: 16.sp,
                    weight: FontWeight.bold,
                    color: AppTheme.greyLight3,
                  ),
                ),
              if (state.popular.results.isNotEmpty) SizedBox(height: 0.5.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.popular.results.map((e) {
                    return CustomAniContainer(
                      bannerTitle:
                          (state.popular.results.indexOf(e) + 1).toString(),
                      image: e.image,
                      padding: AppDimens.paddingL1,
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
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else if (state is PopularLoading) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: AppDimens.padding1,
                        child: FadeShimmer(
                          width: 32.w,
                          height: 20.h,
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
