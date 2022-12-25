import 'package:flutter/material.dart';

import '../../common/action_button.dart';
import 'profile_parameter.dart';
import 'profile_picture.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ProfilePicture(),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: 4,
            itemBuilder: (context, index) => ProfileParameter(),
          ),
        ),
        const SizedBox(height: 50),
        ActionButton(
          buttonText: "Sign Out",
          onPressed: () => {print("object")}
        ),
        const Spacer(),
      ],
    );
  }
}