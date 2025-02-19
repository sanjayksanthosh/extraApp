import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/services/authservices.dart';

class Loginprovier extends ChangeNotifier {
  bool _isloading = false;
  String? _token;
  String? _message;

bool get isloading => _isloading;
String? get token => _token;
String? get message => _message;

  var authservices = Authservices();
  Future login(String username, String pass) async {
    _isloading = true;
    notifyListeners();
final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await authservices.login(username, pass);
      _message = response["message"];
      _token = response["token"];
await prefs.setString('token', _token!);
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
