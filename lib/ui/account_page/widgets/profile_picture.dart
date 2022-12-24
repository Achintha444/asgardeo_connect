import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  
  final String? letter;

  const ProfilePicture({
    Key? key,
    this.letter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.orangeAccent.shade700,
      child: const Text('AH'),
      maxRadius: 30,
    );
  }
}