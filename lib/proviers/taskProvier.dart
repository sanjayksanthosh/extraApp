import 'package:flutter/material.dart';
import 'package:testapp/services/taskservices.dart';

class Taskprovier extends ChangeNotifier{
bool _isloading = false;
List _taskList= [];

List get taskList => _taskList;





Future getTask() async {
    _isloading = true;
    notifyListeners();
    try {
      final response = await Taskservices().getTask();
      print(response);
      _taskList = response;

      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }

Future postTask(String title,String description) async {
    // _isloading = true;
    // notifyListeners();
    try {
      final response = await Taskservices().postTask(title,description);
      print(response);
   getTask();

      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }


Future updateTask(String title,String description,String id) async {
    // _isloading = true;
    // notifyListeners();
    try {
      final response = await Taskservices().updateTask(title,description,id);
      print(response);
   getTask();

      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
Future deleteTask(String id) async {
    // _isloading = true;
    // notifyListeners();
    try {
      final response = await Taskservices().deleteTask(id);
      print(response);
   getTask();

      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }


}