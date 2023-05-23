import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

import 'manager_colors.dart';

class ManagerTextThemeDark extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get headlineMedium => getMediumStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get titleMedium => getMediumStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get bodyLarge => getRegularStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );
}
