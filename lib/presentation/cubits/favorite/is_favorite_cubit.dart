import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsFavoriteCubit extends Cubit<bool> {
  IsFavoriteCubit() : super(false);

  Future<bool> isFavorite(
      {required String userId, required String animeId}) async {
    final favorite = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('favorite')
        .doc(animeId)
        .get();
    if (favorite.data() != null) {
      emit(true);
      return true;
    } else {
      emit(false);
      return false;
    }
  }
}
