import 'package:flutter_appauth/flutter_appauth.dart';

abstract class LoginControllerUtil {
  static const FlutterAppAuth _flutterAppAuthObject = FlutterAppAuth();

  /// get the [FlutterAppAuth] object
  static FlutterAppAuth getFlutterAppAuthObject() {
    return _flutterAppAuthObject;
  }
}
