import 'package:asgardeo_connect/ui/account_page/widgets/profile_picture.dart';
import "package:asgardeo_connect/util/ui_util.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import '../../common/action_button.dart';
import '../widgets/profile_parameter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Column(
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
            ),
          ),
        ),
      ),
    );
  }
}
