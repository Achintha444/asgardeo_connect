import 'package:asgardeo_connect/ui/account_page/bloc/account_page_bloc.dart';
import 'package:asgardeo_connect/ui/initial_page/bloc/inital_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/action_button.dart';

class SignoutButton extends StatelessWidget {
  final AuthorizationTokenResponse authorizationTokenResponse;

  const SignoutButton({
    super.key,
    required this.authorizationTokenResponse,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      buttonText: "Sign Out",
      onPressed: () {
        context.read<AccountPageBloc>().add(Signout(authorizationTokenResponse: authorizationTokenResponse));
      },
    );
  }
}
