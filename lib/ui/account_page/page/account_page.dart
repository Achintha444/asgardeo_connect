import 'package:asgardeo_connect/ui/account_page/bloc/account_page_bloc.dart';
import 'package:asgardeo_connect/ui/account_page/widgets/profile_picture.dart';
import "package:asgardeo_connect/util/ui_util.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_svg/svg.dart";

import '../../common/action_button.dart';
import '../widgets/profile.dart';
import '../widgets/profile_parameter.dart';

class AccountPage extends StatelessWidget {
  
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 50,
            ),
            const SizedBox(height: 2),
            const Text("Account")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: UiUtil.getMediaQueryWidth(context),
          height: UiUtil.getMediaQueryHeight(context),
          child: Center(
            child: Profile(),
          ),
        ),
      ),
    );
  }

  BlocProvider<AccountPageBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountPageBloc()..add(GetUserInfo(accessToken: "")),
      child: BlocListener<AccountPageBloc, AccountPageState>(
        listener: (context, state) {
          if (state is UserInfoFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              UiUtil.getSnackBar("Fetch Userinfo Failed"),
            );
          } else if (state is SignoutFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              UiUtil.getSnackBar("Signout Failed"),
            );
          } else if (state is SignoutSuccess) {
            Navigator.pushNamed(
              context,
              '/',
            );
          }
        },
        child: BlocBuilder<AccountPageBloc, AccountPageState>(
          builder: (context, state) {
            if (state is Initial || state is Loading) {
              return const CircularProgressIndicator();
            } else if (state is UserInfoSucess) {
              return const Profile();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
