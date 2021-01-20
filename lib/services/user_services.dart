
import 'package:http/http.dart' as http;

class API {
  static const String BASE_URL = "https://jsonplaceholder.typicode.com";

  Future<http.Response> getUsers() async {
    var url = "$BASE_URL/users";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(url, headers: headers);
  }
}