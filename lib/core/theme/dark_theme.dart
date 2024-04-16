import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeManager {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
      )));
}
