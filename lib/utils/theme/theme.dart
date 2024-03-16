import 'package:courier_client_app/utils/colors.dart';
import 'package:courier_client_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/outlined_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/text_field.dart';
import 'package:courier_client_app/utils/theme/custom_themes/text_theme.dart';
import 'package:courier_client_app/utils/theme/custom_themes/bottom_navigation_bar_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: TBottomNavigatorBarTheme.lightBottomNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.dark,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
      chipTheme: TChipTheme.darkChipTheme,
      outlinedButtonTheme: TOutlineButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
      navigationBarTheme:
          TBottomNavigatorBarTheme.darkBottomNavigationBarTheme);
}
