import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class TDatePickerTheme {
  TDatePickerTheme();

  static DatePickerThemeData lightDatePickerTheme =
      const DatePickerThemeData(backgroundColor: AppColors.white);

  static DatePickerThemeData darkDatePickerTheme =
      const DatePickerThemeData(backgroundColor: AppColors.dark);
}
