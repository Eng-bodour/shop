import 'package:flutter/material.dart';

const Color mainColor = Color(0Xff00BE84);
const Color darkGrayClr = Color(0XFF121212);
const Color pinkClr = Color(0XFFff4667);
const Color kColor1 = Color(0Xff685959);
const Color kColor2 = Color(0XffADA798);
const Color kColor3 = Color(0XffA5947F);
const Color kColor4 = Color(0Xff738871);
const Color kColor5 = Color(0Xff6D454D);

class ThemesApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: darkGrayClr,
      backgroundColor: darkGrayClr,
      brightness: Brightness.dark);
}
