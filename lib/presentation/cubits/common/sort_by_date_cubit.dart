import 'package:flutter_bloc/flutter_bloc.dart';

class SortByDateCubit extends Cubit<bool> {
  SortByDateCubit() : super(true);

  void sortToLatest() {
    emit(true);
  }

  void sortToOldest() {
    emit(false);
  }
}
