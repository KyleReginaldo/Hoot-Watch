// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:substring_highlight/substring_highlight.dart';

import 'package:yoyo/core/constants/constant.dart';
import 'package:yoyo/core/router/custom_router.dart';
import 'package:yoyo/presentation/blocs/search/search_bloc.dart';

import '../../../../core/utils/custom_functions.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../customs/text.dart';

class SearchPageDelegate extends SearchDelegate<SearchEntity> {
  final Bloc<SearchEvent, SearchState> searchBloc;

  SearchPageDelegate({
    required this.searchBloc,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
        filled: true,
        fillColor: AppTheme.greyDark1,
        hintStyle: const TextStyle().copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(Search(query: query));
    return BlocBuilder(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchLoaded) {
          return ListView(
            children: state.search.results.map((e) {
              return GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(InfoRoute(id: e.id));
                },
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: e.image,
                        height: 16.h,
                        width: 25.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SubstringHighlight(
                                text: e.title.english ??
                                    e.title.userPreferred ??
                                    e.title.native ??
                                    e.title.romaji ??
                                    '',
                                term: query,
                                textStyle: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.greyLight2,
                                ),
                                textStyleHighlight: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                            CustomText(
                              CustomFunctions.removeTags(e.description ?? ''),
                              size: 14.sp,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              color: AppTheme.greyLight1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 1.w),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        } else if (state is SearchLoading) {
          return ListView(
            children: List.generate(
              6,
              (index) => Padding(
                padding: EdgeInsets.all(0.5.h),
                child: FadeShimmer(
                  height: 16.h,
                  width: 100.w,
                  highlightColor: AppTheme.greyDark1,
                  baseColor: AppTheme.greyDark2,
                ),
              ),
            ),
          );
        } else if (state is SearchError) {
          return CustomText(
            'Sorry, we could not find the anime you are looking for. ',
            size: 18.sp,
            textAlign: TextAlign.center,
            weight: FontWeight.w600,
            color: AppTheme.greyLight1,
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              'What you are\nlooking for?',
              color: const Color(0xFF9fa1a2),
              size: 24.sp,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
            ),
            CustomText(
              'Find your favorite Anime Between more\nThan 10,000 Anime',
              color: const Color(0xFF9fa1a2),
              size: 14.sp,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
