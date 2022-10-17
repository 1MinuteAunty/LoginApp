import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_mysql/model/custom_response.dart';

Future<CustomResponse> createUser(String username, String password) async {
  try {
    String uri = "http://himat-143.000webhostapp.com/createUser.php";
    CustomResponse ans = CustomResponse();

    final response = await http.post(Uri.parse(uri),
        body: {"username": username, "password": password});

    final data = jsonDecode(response.body);

    if (data['isAlreadyUser'] == "true") {
      ans.status = false;
      ans.message = "Username is taken! try another username";
      return ans;
    }

    if (data["userCreated"] == "true") {
      ans.status = true;
      return ans;
    } else {
      ans.status = false;
      return ans;
    }
  } catch (e) {
    print(e);
    return CustomResponse(status:false,message:e.toString());
  }
}
