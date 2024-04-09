import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:courier_client_app/models/UserInfo.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// models
import 'package:courier_client_app/models/OrderTypes.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

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

  void deleteData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      print("Error at getting data from shared preferences: ${e.toString()}");
    }
  }

  // get city name from address
  static Future<String?> getCityName() async {
    try {
      final response = await getData<String>(Constants.user);
      if (response?.isEmpty == false) {
        Map<String, dynamic> jsonMap = json.decode(response.toString());
        UserInfo userInfo = UserInfo.fromJson(jsonMap);
        String address = userInfo.address!;

        List<String> parts = address.split(',');

        // get the last part as city name
        String cityName = parts.last.trim();

        // if the last part is the same as the address, meaning there's no comma
        if (cityName == address) {
          // split the address by space
          parts = address.split(' ');

          // get the last part as city name
          cityName = parts.last.trim();
        }

        return cityName;
      } else {
        throw Exception("Unable to fetch city");
      }
    } catch (e) {
      print("Error at getting user's city name $e");
    }
  }

  // convert to currency format
  static String currencyFormat(double amount) {
    try {
      final formatter = NumberFormat.currency(locale: 'si_LK', symbol: 'Rs');
      return formatter.format(amount);
    } catch (e) {
      print("Unable to convert to currency format $e");
    }
    throw Exception("Unable to convert to currency format");
  }
}
