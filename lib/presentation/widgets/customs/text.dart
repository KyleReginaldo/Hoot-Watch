import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final String? text;
  final double? spacing;
  final int? maxLines;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextStyle? textStyle;
  final Type? type;
  const CustomText(
    this.text, {
    super.key,
    this.size,
    this.overflow,
    this.weight,
    this.color = Colors.white,
    this.spacing,
    this.maxLines,
    this.textAlign,
    this.letterSpacing,
    this.softWrap,
    this.textStyle,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'no text',
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap ?? true,
      style: textStyle?.copyWith(
            letterSpacing: letterSpacing ?? 0,
            fontSize: size,
            fontWeight: weight,
            wordSpacing: spacing,
            color: color,
            fontFamily: 'NetflixSans',
          ) ??
          TextStyle(
            letterSpacing: letterSpacing ?? 0,
            fontSize: size,
            fontWeight: weight,
            wordSpacing: spacing,
            color: color,
            fontFamily: 'NetflixSans',
          ),
    );
  }
}
