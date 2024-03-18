import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class TTimePickerTheme {
  TTimePickerTheme();

  static TimePickerThemeData lightTimePickerTheme =
      const TimePickerThemeData(backgroundColor: AppColors.white);

  static TimePickerThemeData darkTimePickerTheme =
      const TimePickerThemeData(backgroundColor: AppColors.dark);
}
