import 'package:act_hub/core/widgets/will_pop_scope.dart';
import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_assets.dart';

Widget scaffoldWithBackGroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String image = ManagerAssets.background,
}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    ),
  );
}
