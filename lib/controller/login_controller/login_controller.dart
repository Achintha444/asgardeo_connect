import 'package:asgardeo_connect/controller/controller.dart';
import 'package:asgardeo_connect/util/controller_util/login_controller/authorization_config_util.dart';
import 'package:asgardeo_connect/util/controller_util/login_controller/login_controller_util.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends Controller {

  static final FlutterAppAuth _flutterAppAuth = LoginControllerUtil.getFlutterAppAuthObject();
  static final FlutterSecureStorage _flutterSecureStorage = LoginControllerUtil.getFlutterSecureStorageObject();

  Future<void> loginAction() async {

    String clinetId = await AuthorizationConfigUtil.getClientId();
    String clinetSecret = await AuthorizationConfigUtil.getClientSecret();

    try {
      final AuthorizationTokenResponse result =
          await _flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clinetId,
          clinetSecret,
          AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl: await AuthorizationConfigUtil.getDiscoveryUrl(),
          scopes: ['openid', 'profile', 'offline_access'],
        ),
      );

      final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  // Future<Map> getUserDetails(String accessToken) async {...}

  // void logoutAction() async {...}
}
