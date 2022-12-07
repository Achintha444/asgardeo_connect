// ignore_for_file: prefer_const_constructors

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LoginControllerUtil {
  static final FlutterAppAuth _flutterAppAuthObject = FlutterAppAuth();
  static final FlutterSecureStorage _flutterSecureStorageObject =
      FlutterSecureStorage();

  /// get the [FlutterAppAuth] object
  static FlutterAppAuth getFlutterAppAuthObject() {
    return _flutterAppAuthObject;
  }

  /// get the [FlutterSecureStorage] object
  static FlutterSecureStorage getFlutterSecureStorageObject() {
    return _flutterSecureStorageObject;
  }
}
