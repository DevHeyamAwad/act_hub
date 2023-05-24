import 'package:act_hub/core/resources/manager_fonts.dart';
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
    {String fontFamily = ManagerFontFamily.fontFamily,
    required Color color,
    TextDecoration decoration = TextDecoration.none,
    required double fontSize}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: ManagerFontWight.medium,
      color: color,
      decoration: decoration,
      fontSize: fontSize);
}

TextStyle getRegularTextStyle(
    {String fontFamily = ManagerFontFamily.fontFamily,
    required Color color,
    TextDecoration decoration = TextDecoration.none,
    required double fontSize}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: ManagerFontWight.regular,
      color: color,
      decoration: decoration,
      fontSize: fontSize);
}

TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: ManagerFontWight.bold,
    color: color,
    decoration: decoration,
  );
}

TextStyle getTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  FontWeight? weight,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: weight ?? ManagerFontWight.medium,
    color: color,
    decoration: decoration,
  );
}
