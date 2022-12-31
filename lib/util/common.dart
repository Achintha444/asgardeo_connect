import "dart:convert";
import "package:http/http.dart" as http;

abstract class Common {
  /// Decode JSON from a json string
  static Map<String, dynamic> jsonDecode(String jsonString) {
    return json.decode(jsonString);
  }

  /// common authroization call
  static Future<http.Response> getCall(String accessToken, String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    return response;
  }
}
