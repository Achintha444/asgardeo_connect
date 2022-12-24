import 'dart:developer';

import 'package:asgardeo_connect/controller/controller.dart';
import 'package:asgardeo_connect/util/authorization_config_util.dart';
import 'package:asgardeo_connect/util/controller_util/login_controller/login_controller_util.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../user_details_controller/user_details_controller.dart';

class LoginController extends Controller{
  static final FlutterAppAuth _flutterAppAuth =
      LoginControllerUtil.getFlutterAppAuthObject();
  static final FlutterSecureStorage _flutterSecureStorage =
      LoginControllerUtil.getFlutterSecureStorageObject();

  static Future<void> loginAction() async {
    final String clinetId = await AuthorizationConfigUtil.getClientId();
    final List<String> scopes = await AuthorizationConfigUtil.getScopes();
    final String baseOrganizationUrl =
        await AuthorizationConfigUtil.getBaseOrganizationUrl();

    try {
      final AuthorizationTokenResponse? result =
          await _flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clinetId,
          AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl:
              "$baseOrganizationUrl/oauth2/token/.well-known/openid-configuration",
          scopes: scopes,
        ),
      );
      inspect(result);

      if (result != null) {
        final user =
            UserDetailsController.getUserDetails(result.accessToken as String);
        inspect(user);
      }
    } catch (e, s) {
      inspect('login error: $e - stack: $s');
      throw Exception('Failed to login');
    }
  }

  // void logoutAction() async {...}
}
