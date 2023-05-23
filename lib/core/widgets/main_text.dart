import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_styles.dart';

class MainText extends StatefulWidget {
  const MainText({super.key});

  @override
  State<MainText> createState() => _MainTextState();
}

class _MainTextState extends State<MainText> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {},
        child: Text(
          ManagerStrings.skip,
          style: getRegularStyle(
            color: ManagerColors.textColor,
            fontSize: ManagerFontSize.s16,
          ),
        ));
  }
}
