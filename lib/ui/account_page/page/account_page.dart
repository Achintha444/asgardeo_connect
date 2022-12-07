import "package:asgardeo_connect/util/strings.dart";
import "package:asgardeo_connect/util/ui_util.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

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
          width: getMediaQueryWidth(context),
          height: getMediaQueryHeight(context),
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
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white38),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                            width: 1, // the thickness
                            color: Colors.orange // the color of the border
                            ),
                      ),
                    ),
                    child: const Text("Sign Out"),
                  ),
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
