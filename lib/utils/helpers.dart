import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// models
import 'package:courier_client_app/models/OrderTypes.dart';

class Helper {
  static showConsole(dynamic payload) {
    if (kDebugMode) {
      print(payload);
    }
  }

  static Future<void> setData<T>(String key, T payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (T == String) {
      await prefs.setString(key, payload as String);
    } else if (T == bool) {
      await prefs.setBool(key, payload as bool);
    } else if (T == int) {
      await prefs.setInt(key, payload as int);
    } else {
      throw Exception("Unable to save to shared preferces");
    }
  }

  static Future<T?> getData<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == bool) {
      dynamic result = await prefs.getBool(key);
      return result;
      // return prefs.getBool(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else {
      throw Exception("Unsupported data type");
    }
  }

  /*  static Future<void> setData(String key, dynamic payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, payload);
    } catch (e) {
      print("Error at saving data to shared preferences: ${e.toString()}");
    }
  }

  static Future<bool?> getData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dynamic response = prefs.getString(key);
      return response;
    } catch (e) {
      print("Error at getting data from shared preferences: ${e.toString()}");
    }
  }
 */
  void deleteData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      print("Error at getting data from shared preferences: ${e.toString()}");
    }
  }
}
