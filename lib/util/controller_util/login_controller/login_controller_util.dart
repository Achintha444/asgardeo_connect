// ignore_for_file: prefer_const_constructors

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth _flutterAppAuthObject =   FlutterAppAuth();
final FlutterSecureStorage _flutterSecureStorageObject = FlutterSecureStorage();

FlutterAppAuth getFlutterAppAuthObject() {

  return _flutterAppAuthObject;
}

FlutterSecureStorage getFlutterSecureStorageObject() {

  return _flutterSecureStorageObject;
}
