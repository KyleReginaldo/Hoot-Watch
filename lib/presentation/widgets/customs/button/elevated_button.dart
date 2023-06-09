// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/presentation/widgets/customs/text.dart';

import '../../../../core/constants/constant.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final double? height;
  final double? width;
  final Color? color;
  final Color? bgColor;
  final double? radius;
  final double? fontSize;
  final FontWeight? weight;
  const CustomElevatedButton(
    this.text, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.bgColor,
    this.radius,
    this.onPressed,
    this.fontSize,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(color ?? AppTheme.white),
        fixedSize: MaterialStatePropertyAll(Size(width ?? 60.w, 5.h)),
        backgroundColor: MaterialStatePropertyAll(bgColor ?? AppTheme.grey),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(radius ?? AppDimens.minRadius))),
      ),
      child: CustomText(
        text,
        size: fontSize,
        weight: weight,
      ),
    );
  }
}
