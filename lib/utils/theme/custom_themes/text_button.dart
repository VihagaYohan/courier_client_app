import 'package:flutter/material.dart';

// constants
import 'package:courier_client_app/utils/utils.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: AppColors.white,
  ));

  static final darkTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: AppColors.dark));
}
