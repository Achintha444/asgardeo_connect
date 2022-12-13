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
          width: UiUtil.getMediaQueryWidth(context),
          height: UiUtil.getMediaQueryHeight(context),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.orangeAccent.shade700,
                  child: const Text('AH'),
                  maxRadius: 30,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: 4,
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        height: double.infinity,
                        child: Icon(Icons.phone),
                      ),
                      dense: true,
                      title: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38),
                      ),
                      subtitle: Text(
                        "071-838-1361",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      style: ListTileStyle.list,
                    ),
                  ),
                ),
                SizedBox(height: 50),
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
