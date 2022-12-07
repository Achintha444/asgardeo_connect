import 'package:asgardeo_connect/util/common.dart';
import 'package:flutter/services.dart';

abstract class AuthorizationConfigUtil {

  static const String _REDIRECT_URL = "com.wso2.flutterconnect://login-callback ";

  /// read the config.json file and return the content
  /// [return] [Map<String, dynamic>]
  static Future<Map<String, dynamic>> _readConfigJson() async {
    final String config = await rootBundle.loadString('assets/config.json');
    final Map<String, dynamic> configJson = Common.jsonDecode(config);

    return configJson;
  }

  /// get the base organization url
  static Future<String> _getBaseOrganizationUrl() async {
    final Map<String, dynamic> configJson = await _readConfigJson();

    return configJson["AuthorizationConfig"]["BaseOrganizationUrl"];
  }

  /// get the client id
  static Future<String> getClientId() async {
    final Map<String, dynamic> configJson = await _readConfigJson();

    return configJson["AuthorizationConfig"]["ClientId"];
  }

  /// get the client secret
  static Future<String> getClientSecret() async {
    final Map<String, dynamic> configJson = await _readConfigJson();

    return configJson["AuthorizationConfig"]["ClientSecret"];
  }

  static String getRedirectUrl() {
    return _REDIRECT_URL;
  }

  static Future<String> getDiscoveryUrl() async{

    String baseUrl = await _getBaseOrganizationUrl();

    return "$baseUrl/oauth2/token/.well-known/openid-configuration";
  }
}
