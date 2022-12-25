import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String userNmae;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.userNmae,
  });

  @override
  List<Object?> get props => [id, email, fullName, userNmae];
}
