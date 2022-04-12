import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
        indicatorColor:
            isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
        hintColor:
            isDarkTheme ? const Color(0xffEECED3) : const Color(0xff372901),
        highlightColor:
            isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
        hoverColor:
            isDarkTheme ? Colors.grey : Colors.grey.withAlpha(75),
        focusColor:
            isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: isDarkTheme ? const Color(0xff3A3A3B) : Colors.lightBlue
        ),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: isDarkTheme ? Colors.white : Colors.black),
        bottomNavigationBarTheme: Theme.of(context)
            .bottomNavigationBarTheme
            .copyWith(
                backgroundColor: isDarkTheme ? const Color(0xff3A3A3B) : Colors.lightBlue,
                selectedItemColor:
                    isDarkTheme ? const Color(0xffA8DAB5) : Colors.white));
  }
}
