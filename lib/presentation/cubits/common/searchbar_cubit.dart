import 'package:flutter_bloc/flutter_bloc.dart';

class SearchbarCubit extends Cubit<bool> {
  SearchbarCubit() : super(false);

  void enable() => emit(true);
  void disable() => emit(false);
}
