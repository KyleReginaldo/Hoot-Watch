// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateUserDto {
  final String username;
  final String bio;
  String? imageLink;
  final String uid;
  UpdateUserDto({
    required this.username,
    required this.bio,
    this.imageLink,
    required this.uid,
  });
}
