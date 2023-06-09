import 'package:flutter_bloc/flutter_bloc.dart';

class InfoswitchCubit extends Cubit<int> {
  InfoswitchCubit() : super(0);

  void switchTab(int val) => emit(val);
  void dispose() => emit(0);
}
