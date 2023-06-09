import 'package:flutter_bloc/flutter_bloc.dart';

class BnbCubit extends Cubit<int> {
  BnbCubit() : super(0);

  void navigate(int index) => emit(index);
}
