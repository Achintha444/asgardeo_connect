import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  
  final String fullName;

  const ProfilePicture({
    Key? key,
    required this.fullName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.orangeAccent.shade700,
      maxRadius: 30,
      child: Text(fullName.characters.first),
    );
  }
}