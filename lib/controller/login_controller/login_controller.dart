import 'package:asgardeo_connect/controller/controller.dart';
import 'package:asgardeo_connect/util/controller_util/login_controller/authorization_config_util.dart';
import 'package:asgardeo_connect/util/controller_util/login_controller/login_controller_util.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends Controller {

  static final FlutterAppAuth _flutterAppAuth = LoginControllerUtil.getFlutterAppAuthObject();
  static final FlutterSecureStorage _flutterSecureStorage = LoginControllerUtil.getFlutterSecureStorageObject();

  static Future<void> loginAction() async {

    String clinetId = await AuthorizationConfigUtil.getClientId();
    String clinetSecret = await AuthorizationConfigUtil.getClientSecret();
    List<String> scopes = await AuthorizationConfigUtil.getScopes();
    
    try {

      final AuthorizationTokenResponse? result =
          await _flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clinetId,
          AuthorizationConfigUtil.getRedirectUrl(),
          clientSecret: clinetSecret,
          discoveryUrl: "https://api.asgardeo.io/t/flutterconnect/oauth2/token/.well-known/openid-configuration",
          scopes: scopes,
        ),
      );
      print("object");
      print(result);

      // final idToken = parseIdToken(result.idToken);
      // final profile = await getUserDetails(result.accessToken);

      // await _flutterSecureStorage.write(
      //     key: 'refresh_token', value: result.refreshToken);

    } catch (e, s) {
      print('login error: $e - stack: $s');
    }
  }

  // Future<Map> getUserDetails(String accessToken) async {...}

  // void logoutAction() async {...}
}
