import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey[800],
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      focusedBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}
