import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
  });

  @override
  List<Object?> get props => [id, email, fullName];

  /// return `User` object from a relevant json string
  static User fromJsonString(String jsonString) {
    Map<String, dynamic> userMap = jsonDecode(jsonString);

    return User(
      id: userMap["sub"],
      email: userMap["email"],
      fullName: userMap["name"],
    );
  }

  /// return `List` of the user details [`id`, `email`, `fullName`, `username`]
  List<Map<String, String>> toList() {
    return [
      {"id": id},
      {"email/username": email},
      {"fullName": fullName},
    ];
  }
}
