import 'package:flutter/material.dart';

import '../data/constant.dart';

var themeData = ThemeData(
  useMaterial3: true,
  popupMenuTheme: PopupMenuThemeData(
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defBorderRadius / 2),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: defPadding),
    labelStyle: const TextStyle(fontSize: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defBorderRadius),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    outlineBorder: const BorderSide(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defBorderRadius),
      borderSide: const BorderSide(color: Colors.grey),
    ),
  ),
  tabBarTheme: TabBarThemeData(
    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFFC7C7C7),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
      foregroundColor: Colors.white,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
    ),
  ),
  switchTheme: const SwitchThemeData(
    trackOutlineWidth: WidgetStatePropertyAll(0),
    overlayColor: WidgetStatePropertyAll(Colors.white),
    splashRadius: 16,
  ),
);
