import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<XFile?> {
  ImageCubit() : super(null);

  Future<void> pickImage({required ImageSource source}) async {
    await ImagePicker().pickImage(source: source).then((value) {
      emit(value);
    });
  }
}
