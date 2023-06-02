import 'package:flutter/material.dart';
import 'package:quiz_app/themes/app_color.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  // primaryColorVariant: primaryColor,
  secondaryHeaderColor: Colors.teal[200],
  // Override other default colors if needed
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  buttonColor: AppColor.primaryColor,
  // primaryColorVariant: primaryColor,
  secondaryHeaderColor: Colors.teal[200],
  // Override other default colors if needed
);

ThemeData awesomeQuizTheme({bool dark = false}) {
  return dark ? darkTheme : lightTheme;
}
