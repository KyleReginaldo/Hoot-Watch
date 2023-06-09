// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:yoyo/domain/repository/repository.dart';

class UploadImage {
  final Repository repo;
  UploadImage({
    required this.repo,
  });

  Future<void> call({required String path, required File file}) async {
    await repo.uploadImage(path: path, file: file);
  }
}
