// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/constant.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;
  final double? radius;
  final bool? glow;
  const CustomIconButton({
    Key? key,
    this.onTap,
    this.icon,
    this.bgColor,
    this.radius,
    this.glow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
            color: bgColor != null
                ? bgColor?.withOpacity(0.6)
                : Theme.of(context).primaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(radius ?? AppDimens.minRadius),
            boxShadow: (glow ?? false)
                ? [
                    BoxShadow(
                      color: bgColor ?? Theme.of(context).primaryColor,
                      offset: const Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 0.5,
                    ),
                  ]
                : null),
        child: icon,
      ),
    );
  }
}
