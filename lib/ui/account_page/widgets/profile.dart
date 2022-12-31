import 'package:asgardeo_connect/ui/account_page/widgets/signout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../model/user.dart';
import 'profile_parameter.dart';
import 'profile_picture.dart';

class Profile extends StatelessWidget {
  final User user;
  final AuthorizationTokenResponse authorizationTokenResponse;

  const Profile({
    Key? key,
    required this.user,
    required this.authorizationTokenResponse,
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
        SignoutButton(
          authorizationTokenResponse: authorizationTokenResponse,
        ),
        const Spacer(),
      ],
    );
  }
}
