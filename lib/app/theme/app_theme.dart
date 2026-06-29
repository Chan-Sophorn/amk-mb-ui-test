import 'package:amk_mobile/app/theme/app_font.dart';
import 'package:amk_mobile/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData englishTheme = ThemeData(
    fontFamily: AppFont.roboto,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColor.mainColor),
    ),
  );

  static ThemeData khmerTheme = ThemeData(
    fontFamily: AppFont.battambang,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColor.mainColor),
    ),
  );
}
