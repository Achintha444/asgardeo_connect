import 'package:asgardeo_connect/controller/controller.dart';
import 'package:asgardeo_connect/model/user.dart';
import 'package:asgardeo_connect/util/authorization_config_util.dart';
import 'package:asgardeo_connect/util/common.dart';
import 'package:asgardeo_connect/util/controller_util/user_details_controller/user_details_controller_util.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart';

class UserDetailsController extends Controller {
  static Future<User> getUserDetails(AuthorizationTokenResponse authorizationTokenResponse) async {
    String userinfoUrl = await UserDetailsControllerUtil.getUserIntoUrl();
    String accessToken = AuthorizationConfigUtil.getAccessToken(authorizationTokenResponse);

    final Response response = await Common.getCall(accessToken, userinfoUrl);

    if (response.statusCode == 200) {
      return User.fromJsonString(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
