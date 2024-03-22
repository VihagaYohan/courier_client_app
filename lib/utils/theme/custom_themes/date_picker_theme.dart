import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class TDatePickerTheme {
  TDatePickerTheme();

  static DatePickerThemeData lightDatePickerTheme = const DatePickerThemeData(
    backgroundColor: AppColors.white,
    dividerColor: AppColors.primary,
    weekdayStyle: TextStyle(color: AppColors.darkGrey),
  );

  static DatePickerThemeData darkDatePickerTheme = const DatePickerThemeData(
    backgroundColor: AppColors.dark,
    dividerColor: AppColors.primary,
    headerForegroundColor: AppColors.softGrey,
    weekdayStyle: TextStyle(color: AppColors.softGrey),
    dayStyle: TextStyle(color: AppColors.softGrey),
    dayForegroundColor: MaterialStatePropertyAll(AppColors.softGrey),
    yearForegroundColor: MaterialStatePropertyAll(AppColors.softGrey),
    dayOverlayColor: MaterialStatePropertyAll(AppColors.primary),
  );
}
