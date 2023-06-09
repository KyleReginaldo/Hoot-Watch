// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoyo/presentation/widgets/customs/text.dart';

import '../../../core/constants/constant.dart';

class CustomAniContainer extends StatelessWidget {
  final String image;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final String? title;
  final double? width;
  final double? height;
  final bool? haveGradient;
  final String? subtitle;
  final Widget? indicator;
  final String? bannerTitle;
  final double? size;
  const CustomAniContainer({
    Key? key,
    required this.image,
    this.color,
    this.onTap,
    this.padding,
    this.title,
    this.width,
    this.height,
    this.haveGradient = true,
    this.subtitle,
    this.indicator,
    this.bannerTitle,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppDimens.minRadius),
        ),
        clipBehavior: Clip.hardEdge,
        width: width ?? 32.w,
        height: height ?? 20.h,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              height: height ?? 20.h,
              width: width ?? 32.w,
              fit: BoxFit.cover,
            ),
            if (indicator != null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: indicator!,
              ),
            if (bannerTitle != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: AppDimens.padding1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        AppTheme.black,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppDimens.midRadius),
                    ),
                  ),
                  child: CustomText(
                    bannerTitle,
                    weight: FontWeight.bold,
                    size: 16.sp,
                  ),
                ),
              ),
            if (title != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: (haveGradient ?? true) ? 10.h : null,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(0.4.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color?.withOpacity(0.1) ??
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        color?.withOpacity(0.2) ??
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        color?.withOpacity(0.3) ??
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        color?.withOpacity(0.4) ??
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        color?.withOpacity(0.5) ??
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        color?.withOpacity(0.6) ??
                            Theme.of(context).primaryColor.withOpacity(0.6),
                        color?.withOpacity(0.7) ??
                            Theme.of(context).primaryColor.withOpacity(0.7),
                        color?.withOpacity(0.8) ??
                            Theme.of(context).primaryColor.withOpacity(0.8),
                        color?.withOpacity(0.9) ??
                            Theme.of(context).primaryColor.withOpacity(0.9),
                        color ?? Theme.of(context).primaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        color: AppTheme.white,
                        weight: FontWeight.w600,
                        size: size ?? 15.sp,
                      ),
                      if (subtitle != null)
                        CustomText(
                          subtitle,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          color: AppTheme.white,
                          weight: FontWeight.w500,
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
