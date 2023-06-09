import 'package:yoyo/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.email,
    super.imageLink,
    super.isVerified,
    required super.uid,
    required super.password,
    super.bio,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      uid: map['uid'],
      imageLink: map['imageLink'],
      isVerified: map['isVerified'],
      password: map['password'],
      bio: map['bio'],
    );
  }

  factory UserModel.fromE(UserEntity user) {
    return UserModel(
      username: user.username,
      email: user.email,
      uid: user.uid,
      imageLink: user.imageLink,
      isVerified: user.isVerified,
      password: user.password,
      bio: user.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'uid': uid,
      'imageLink': imageLink,
      'isVerified': isVerified,
      "password": password,
      "bio": bio,
    };
  }
}
