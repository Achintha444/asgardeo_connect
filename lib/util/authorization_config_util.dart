import 'package:asgardeo_connect/util/common.dart';
import 'package:flutter/services.dart';

abstract class AuthorizationConfigUtil {
  static const String _redirectUrl =
      "com.wso2.flutterconnect://login-callback";

  /// read the config.json file and return the content
  /// [return] [Map<String, dynamic>]
  static Future<Map<String, dynamic>> _readConfigJson() async {
    final String config = await rootBundle.loadString('config/config.json');
    final Map<String, dynamic> configJson = Common.jsonDecode(config);

    return configJson;
  }

  /// get the base organization url
  static Future<String> getBaseOrganizationUrl() async {
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

  static Future<List<String>> getScopes() async {
    final Map<String, dynamic> configJson = await _readConfigJson();

    return List<String>.from(configJson["AuthorizationConfig"]["Scopes"]);
  }

  static String getRedirectUrl() {
    return _redirectUrl;
  }

  static Future<String> getDiscoveryUrl() async {
    String baseUrl = await getBaseOrganizationUrl();

    return "$baseUrl/oauth2/token/.well-known/openid-configuration";
  }
}
