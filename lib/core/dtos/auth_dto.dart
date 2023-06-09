// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthDto extends Equatable {
  final String email;
  final String password;
  final String? imageLink;
  final String? isVerified;
  final String? username;
  const AuthDto({
    required this.email,
    required this.password,
    this.imageLink,
    this.isVerified,
    this.username,
  });

  @override
  List<Object?> get props => [email, password];
}
