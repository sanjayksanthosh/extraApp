import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp/const.dart';

class Authservices {
  

  Future login(String username, String pass) async {
    final url = Uri.parse(baseUrl + "/login");
    try {
      var body = jsonEncode({"username": username, "password": pass});

      var response =await http.post(url, body: body, headers: {'content-type': 'application/json'});

      
            return jsonDecode(response.body);
          
    } catch (e) {
      print(e);
    }
  }
}
