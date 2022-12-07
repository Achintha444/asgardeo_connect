import "dart:convert";

Map<String, dynamic> jsonDecode(String jsonString) {
  return json.decode(jsonString);
}
