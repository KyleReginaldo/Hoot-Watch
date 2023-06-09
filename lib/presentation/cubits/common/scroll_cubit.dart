import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollCubit extends Cubit<bool> {
  ScrollCubit() : super(false);

  void listen(bool scrolling) {
    emit(scrolling);
  }
}
