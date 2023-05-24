import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: ManagerColors.primaryColor,
      primaryColorLight: ManagerColors.primaryColorLight,
      disabledColor: ManagerColors.disabledColor,
      splashColor: ManagerColors.greyLight,
      scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundLight,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ManagerColors.greyLight,
          elevation: Constants.elevationAppBar,
          titleTextStyle: getBoldTextStyle(
              fontSize: ManagerFontSize.s14,
              color: ManagerColors.primaryColor)),
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(),
          disabledColor: ManagerColors.disabledColor,
          buttonColor: ManagerColors.buttonColorLight),
      textTheme: ManagerTextThemeLight());
}
