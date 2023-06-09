// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoyo/core/constants/constant.dart';
import 'package:yoyo/presentation/widgets/customs/text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? suffix;
  final bool? isObscure;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final GlobalKey<FormState>? formKey;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final bool? lastTextField;
  final int? maxLength;
  final TextInputAction? action;
  final String? initialValue;
  final Color? fontColor;
  final double? width;
  final String label;
  final bool? descType;
  const CustomTextField({
    Key? key,
    this.controller,
    required this.hint,
    this.suffix,
    this.isObscure,
    this.prefix,
    this.validator,
    this.keyboard,
    this.formKey,
    this.radius,
    this.borderColor,
    this.bgColor,
    this.lastTextField,
    this.maxLength,
    this.action,
    this.initialValue,
    this.fontColor,
    this.width,
    required this.label,
    this.descType = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: descType ?? false ? null : 1,
        key: formKey,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        textInputAction: action,
        keyboardType: keyboard,
        maxLength: maxLength,
        obscureText: isObscure ?? false,
        validator: validator,
        onEditingComplete: () {
          if (lastTextField ?? false) {
            node.unfocus();
          }
          {
            node.nextFocus();
          }
        },
        style: TextStyle(color: fontColor, fontSize: 16.sp),
        decoration: InputDecoration(
          label: CustomText(
            label,
            size: 16.sp,
          ),
          hintText: hint,
          suffixIcon: suffix,
          prefixIcon: prefix,
          counterText: '',
          fillColor: AppTheme.grey,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.circular(radius ?? AppDimens.minRadius)),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.circular(radius ?? AppDimens.minRadius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.circular(radius ?? AppDimens.minRadius)),
          hintStyle: TextStyle(
            color: AppTheme.greyLight1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
