import 'package:asgardeo_connect/theme/theme.dart';
import 'package:asgardeo_connect/ui/account_page/page/account_page.dart';
import 'package:asgardeo_connect/ui/initial_page/page/initial_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      initialRoute: '/account',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const InitialPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
