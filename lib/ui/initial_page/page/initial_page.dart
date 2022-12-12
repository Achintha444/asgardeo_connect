import 'package:asgardeo_connect/controller/login_controller/login_controller.dart';
import 'package:asgardeo_connect/controller/user_details_controller/user_details_controller.dart';
import "package:asgardeo_connect/util/strings.dart";
import "package:asgardeo_connect/util/ui_util.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: UiUtil.getMediaQueryWidth(context),
            height: UiUtil.getMediaQueryHeight(context),
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
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async{
                        await LoginController.loginAction();
                        //Navigator.pushReplacementNamed(context, '/account');
                      },
                      child: const Text("Sign In"),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
