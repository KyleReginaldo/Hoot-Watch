import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/core/constants/app_theme.dart';
import 'package:yoyo/core/model/theme_preference.dart';

class ThemePickerCubit extends Cubit<ThemePreferenceModel> {
  ThemePickerCubit() : super(AppTheme.themes.first);

  void pickTheme(ThemePreferenceModel theme) {
    emit(theme);
  }
}
