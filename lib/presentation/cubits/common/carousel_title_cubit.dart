import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselTitleCubit extends Cubit<String> {
  CarouselTitleCubit() : super('');

  void changeTitle(String title) {
    emit(title);
  }
}
