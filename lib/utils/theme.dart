import 'package:flutter/material.dart';

const Color mainColor = Color(0Xff00BE84);
const Color darkGrayClr = Color(0XFF121212);
const Color pinkClr = Color(0XFFff4667);
const Color kColor1 = Color(0Xff685959);
const Color kColor2 = Color(0XffADA798);
const Color kColor3 = Color(0XffA5947F);
const Color kColor4 = Color(0Xff738871);
const Color kColor5 = Color(0Xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

String arabic = 'Arabic (SA)';
String english = 'English (EN)';
String france = 'France (FR)';

String ara = 'ar';
String ene = 'en';
String frf = 'fr';

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
