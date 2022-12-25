import 'package:asgardeo_connect/ui/initial_page/bloc/inital_page_bloc.dart';
import 'package:asgardeo_connect/ui/initial_page/widgets/signin_button.dart';
import "package:asgardeo_connect/util/strings.dart";
import "package:asgardeo_connect/util/ui_util.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_svg/svg.dart";

import '../../common/action_button.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(1, 1),
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0),
            ],
            tileMode: TileMode.clamp,
            radius: 1,
          ),
        ),
        child: _buildBody(context),
      ),
    );
  }

  BlocProvider<InitalPageBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => InitalPageBloc(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 200,
            ),
            const SizedBox(height: 10),
            const Text(
              initialPageMessage,
            ),
            const Spacer(),
            BlocListener<InitalPageBloc, InitalPageState>(
              listener: (context, state) {
                if (state is SigninFail) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    UiUtil.getSnackBar("Signin Failed"),
                  );
                }
              },
              child: BlocBuilder<InitalPageBloc, InitalPageState>(
                builder: (context, state) {
                  if (state is Initial) {
                    return const SigninButton();
                  } else if (state is Loading) {
                    return CircularProgressIndicator();
                  } else if (state is SigninFail) {
                    return const SigninButton();
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
