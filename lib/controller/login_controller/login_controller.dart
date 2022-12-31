import "dart:developer";

import "package:asgardeo_connect/controller/controller.dart";
import "package:asgardeo_connect/util/authorization_config_util.dart";
import "package:asgardeo_connect/util/controller_util/login_controller/login_controller_util.dart";
import "package:flutter_appauth/flutter_appauth.dart";

class LoginController extends Controller {
  static final FlutterAppAuth _flutterAppAuth =
      LoginControllerUtil.getFlutterAppAuthObject();

  /// login function
  static Future<AuthorizationTokenResponse?> loginAction() async {
    final String clinetId = await AuthorizationConfigUtil.getClientId();
    final List<String> scopes = await AuthorizationConfigUtil.getScopes();
    final String discoveryUrl = await AuthorizationConfigUtil.getDiscoveryUrl();

    try {
      final AuthorizationTokenResponse? result =
          await _flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clinetId,
          AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl: discoveryUrl,
          scopes: scopes,
        ),
      );

      return result;
    } catch (e, s) {
      inspect("login error: $e - stack: $s");
      throw Exception("Failed to login");
    }
  }

  /// logout function
  static Future<EndSessionResponse?> logoutAction(
      AuthorizationTokenResponse authorizationTokenResponse) async {
    final String discoveryUrl = await AuthorizationConfigUtil.getDiscoveryUrl();

    try {
      final EndSessionResponse? result = await _flutterAppAuth.endSession(
        EndSessionRequest(
          idTokenHint:
              AuthorizationConfigUtil.getIdToken(authorizationTokenResponse),
          postLogoutRedirectUrl: AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl: discoveryUrl,
        ),
      );

      inspect(result);

      return result;
    } catch (e, s) {
      inspect("logout error: $e - stack: $s");
      throw Exception("Failed to logout");
    }
  }
}
