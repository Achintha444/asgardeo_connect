import 'package:asgardeo_connect/ui/account_page/bloc/account_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/action_button.dart';

class ProfileError extends StatelessWidget {
  final AuthorizationTokenResponse authorizationTokenResponse;

  const ProfileError({
    Key? key,
    required this.authorizationTokenResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Error occured, Try Again!"),
          const SizedBox(height: 10),
          ActionButton(
            buttonText: "Try Again",
            onPressed: () {
              context.read<AccountPageBloc>().add(
                    GetUserInfo(
                      authorizationTokenResponse: authorizationTokenResponse,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
