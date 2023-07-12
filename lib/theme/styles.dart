import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
        indicatorColor: isDarkTheme ? Colors.white : Colors.black,
        hintColor: isDarkTheme ? Colors.grey.shade500 : Colors.grey.shade600,
        errorColor: isDarkTheme ? Colors.red.shade900 : Colors.red.shade500,
        highlightColor:
            isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade200,
        focusColor:
            isDarkTheme ? Colors.yellow : Color.fromARGB(255, 201, 179, 9),
        disabledColor:
            isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade300,
        cardColor: isDarkTheme ? Color.fromARGB(255, 41, 40, 40) : Colors.grey.shade200,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ));
  }
}
