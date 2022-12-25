import 'package:asgardeo_connect/ui/initial_page/bloc/inital_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/action_button.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      buttonText: "Sign In",
      onPressed: () {
        context.read<InitalPageBloc>().add(Signin());
      },
    );
  }
}
