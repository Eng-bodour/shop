import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtilis extends StatelessWidget {
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String textstring;
  final TextDecoration underline;

  // ignore: prefer_const_constructors_in_immutables
  TextUtilis(
      {required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.textstring,
      required this.underline,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textstring,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        color: color,
        fontWeight: fontWeight,
        decoration: underline,
      )),
    );
  }
}
