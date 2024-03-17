import 'dart:convert';

import 'package:courier_client_app/models/OrderTypes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// database
import 'package:courier_client_app/database/courier_db.dart';

class Helper {
  void setData(String key, dynamic payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, payload);
    } catch (e) {
      print("Error at saving data to shared preferences: ${e.toString()}");
    }
  }

  dynamic getData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dynamic response = prefs.get(key);
      return response;
    } catch (e) {
      print("Error at getting data from shared preferences: ${e.toString()}");
    }
  }

  void deleteData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      print("Error at getting data from shared preferences: ${e.toString()}");
    }
  }
}
