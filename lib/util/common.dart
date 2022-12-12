import "dart:convert";
import 'package:http/http.dart' as http;

abstract class Common {
  static Map<String, dynamic> jsonDecode(String jsonString) {
    return json.decode(jsonString);
  }

  static Future<http.Response> getCall(String accessToken, String url) async {
    //todo: set the access token in the secure store to use it.
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    return response;
  }
}
