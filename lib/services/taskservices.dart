import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:testapp/const.dart';

class Taskservices {



 gettoken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
}


//get task
  Future getTask() async {
    final url = Uri.parse(baseUrl + "/tasks");
var token =await gettoken();
    print(token);

    try {
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'content-type': 'application/json'
      });

      return jsonDecode(response.body);
    } catch (e) {
      print("e");
      print(e);
    }
  }

//post task
  Future postTask(String title, String description) async {
    final url = Uri.parse(baseUrl + "/tasks");
    var token =await gettoken();


    var jsonbody = jsonEncode({"title": title, "description": description});

    try {
      var response = await http.post(url, body: jsonbody, headers: {
        'Authorization': 'Bearer $token',
        'content-type': 'application/json'
      });

      return jsonDecode(response.body);
    } catch (e) {
      print("e");
      print(e);
    }
  }

//put task


 Future updateTask(String title, String description,String id) async {
    final url = Uri.parse(baseUrl + "/tasks/$id");
 var token =await gettoken();


    var jsonbody = jsonEncode({"title": title, "description": description});

    try {
      var response = await http.put(url, body: jsonbody, headers: {
        'Authorization': 'Bearer $token',
        'content-type': 'application/json'
      });

      return jsonDecode(response.body);
    } catch (e) {
      print("e");
      print(e);
    }
  }


//delet task



 Future deleteTask(String id) async {
    final url = Uri.parse(baseUrl + "/tasks/$id");
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString("token");

var token =await gettoken();


    try {
      var response = await http.delete(url,  headers: {
        'Authorization': 'Bearer $token',
        'content-type': 'application/json'
      });

      return jsonDecode(response.body);
    } catch (e) {
      print("e");
      print(e);
    }
  }
}
