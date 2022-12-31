import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/user.dart';
import '../../common/action_button.dart';
import 'profile_parameter.dart';
import 'profile_picture.dart';

class Profile extends StatelessWidget {
  final User user;

  const Profile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ProfilePicture(
          fullName: user.fullName,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: user.toList().length,
            itemBuilder: ((context, index) =>
                ProfileParameter(parameterObject: user.toList()[index])),
          ),
        ),
        const SizedBox(height: 50),
        ActionButton(
            buttonText: "Sign Out", onPressed: () => {print("object")}),
        const Spacer(),
      ],
    );
  }
}
