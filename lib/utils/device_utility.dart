import 'dart:io';

import 'package:courier_client_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = MediaQuery.of(context).viewInsets;
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

  static Future<void> showAlertDialog(
      BuildContext context, title, content, buttonTitle, buttonPress, icon,
      {Color iconContainerColor = AppColors.primary,
      Color iconColor = AppColors.white,
      double iconSize = 25}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: iconContainerColor),
              child: Icon(icon, size: iconSize, color: iconColor),
            ),
            title: UITextView(text: title),
            content: UITextView(text: content),
            actions: <Widget>[
              UIElevatedButton(label: buttonTitle, onPress: buttonPress)
            ],
          );
        });
  }

  static Future<DateTime?> getDatePicker(BuildContext context) async {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    final firstDate = DateTime(1990);
    final lastDate = DateTime(2050);
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        helpText: 'Select a date',
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: AppColors.white,
                onSurface: brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.textPrimary,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white),
              ),
            ),
            child: child!,
          );
        });
  }
}
