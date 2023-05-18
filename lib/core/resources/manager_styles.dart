import 'package:flutter/material.dart';

TextStyle _textStyle(
    {required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required TextDecoration decoration}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getMediumStyle(
    {required String fontFamily,
    required Color color,
    required TextDecoration decoration,
    required FontStyle fontStyle}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      decoration: decoration,
      fontStyle: fontStyle);
}

TextStyle getRegularStyle(
    {required String fontFamily,
    required Color color,
    required TextDecoration decoration,
    required FontStyle fontStyle}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      decoration: decoration,
      fontStyle: fontStyle);
}
