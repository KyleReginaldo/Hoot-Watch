import 'package:flutter_bloc/flutter_bloc.dart';

class FullscreenCubit extends Cubit<bool> {
  FullscreenCubit() : super(false);

  void changeScreen(bool val) => emit(val);
}
