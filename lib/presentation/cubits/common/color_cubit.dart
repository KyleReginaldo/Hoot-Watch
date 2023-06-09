import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/core/constants/constant.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(AppTheme.systemRed);

  void pickColor(Color color) {
    emit(color);
  }
}
