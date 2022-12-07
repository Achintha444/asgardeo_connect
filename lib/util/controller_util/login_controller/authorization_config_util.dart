
import 'package:asgardeo_connect/util/common.dart';
import 'package:flutter/services.dart';

/// read the config.json file and return the content
/// [return] [Map<String, dynamic>]
Future<Map<String, dynamic>> _readConfigJson() async {
  final String config = await rootBundle.loadString('assets/config.json');
  final Map<String, dynamic> configJson = jsonDecode(config);

  return configJson;
}

/// get the base organization url
Future<String> getBaseOrganizationUrl() async{
  final Map<String, dynamic> configJson =  await _readConfigJson();

  return configJson["AuthorizationConfig"]["BaseOrganizationUrl"];
}

/// get the client id
Future<String> getClientId() async{
  final Map<String, dynamic> configJson =  await _readConfigJson();

  return configJson["AuthorizationConfig"]["ClientId"];
}

/// get the client secret
Future<String> getClientSecret() async{
  final Map<String, dynamic> configJson =  await _readConfigJson();
  
  return configJson["AuthorizationConfig"]["ClientSecret"];
}
