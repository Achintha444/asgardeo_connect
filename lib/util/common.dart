import "dart:convert";

abstract class Common {
  static Map<String, dynamic> jsonDecode(String jsonString) {
    return json.decode(jsonString);
  }
}
