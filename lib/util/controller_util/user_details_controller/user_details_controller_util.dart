import '../../authorization_config_util.dart';

abstract class UserDetailsControllerUtil {

  /// get the base userinfo url
  static Future<String> getUserIntoUrl() async {
    String baseUrl = await AuthorizationConfigUtil.getBaseOrganizationUrl();

    return "$baseUrl/oauth2/userinfo";
  }
}
