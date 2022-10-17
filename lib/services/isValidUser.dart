import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> isValidUser(String username, String password) async {
  try {
    String uri = "http://himat-143.000webhostapp.com/isValidUser.php";

    final response = await http.post(Uri.parse(uri),
        body: {"username": username, "password": password});

    final data = jsonDecode(response.body);
    if (data["isValidUser"] == "true") {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
