import 'package:flutter_bloc/flutter_bloc.dart';

class PlayingCubit extends Cubit<String?> {
  PlayingCubit() : super(null);

  void setId(String id) => emit(id);
}
