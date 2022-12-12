import 'dart:convert';

import 'package:asgardeo_connect/controller/controller.dart';
import 'package:asgardeo_connect/util/common.dart';
import 'package:asgardeo_connect/util/controller_util/user_details_controller/user_details_controller_util.dart';

class UserDetailsController extends Controller {

  static Future<Map<String, dynamic>> getUserDetails(String accessToken) async {

    String userinfoUrl = await UserDetailsControllerUtil.getUserIntoUrl();

    final response = await Common.getCall(accessToken, userinfoUrl);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

}
