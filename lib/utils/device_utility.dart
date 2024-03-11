import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  static double getScreenHeight() {
    return MediaQuery.of(context as BuildContext).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(context as BuildContext).size.width;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = MediaQuery.of(context as BuildContext).viewInsets;
    return viewInsets.bottom < 0;
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
