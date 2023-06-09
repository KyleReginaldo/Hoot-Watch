// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/repository/repository.dart';

class GetDownloadUrl {
  final Repository repo;
  GetDownloadUrl({
    required this.repo,
  });
  Future<String> call({required String path}) async {
    return await repo.getDownloadUrl(path: path);
  }
}
