import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get headlineMedium => getMediumStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get titleMedium => getMediumStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );
}
