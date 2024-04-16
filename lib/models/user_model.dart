import 'dart:convert';

const String notAvailable = 'Not Available';

class UserModel {
  final String email;
  final String name;

  const UserModel({
    required this.email,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return UserModel(
      email: json['email'] ?? notAvailable,
      name: json['name'] ?? notAvailable,
    );
  }
}

UserModel modelUser(String data) {
  return UserModel.fromJson(jsonDecode(data));
}
