import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  AppTextStyle._();

  static TextStyle bold ({
    double? fontSize,
    Color? color
  }) => GoogleFonts.nunito(
    fontWeight: FontWeight.w900,
    color: color ?? Colors.white,
    fontSize: fontSize
  );

  static TextStyle medium ({
    double? fontSize,
    Color? color
  }) => GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    color: color ?? Colors.white,
    fontSize: fontSize
  );

  static TextStyle normal ({
    double? fontSize,
    Color? color
  }) => GoogleFonts.nunito(
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white,
    fontSize: fontSize
  );
}