import 'package:flutter/material.dart';

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
    primaryColor: Colors.blue,
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary:
              isDarkTheme ? const Color(0x0ff1a1fc) : const Color(0xffe8fdfd),
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
    cardColor: isDarkTheme ? const Color(0xff0a0d2c) : const Color(0xffe8fdfd),
    canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light(),
        ),
  );
}
