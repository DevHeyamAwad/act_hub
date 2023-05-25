import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_sizes.dart';

Widget mainButton({
  required Widget child,
  void Function()? onPressed,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
}) {
  return MaterialButton(
    onPressed: onPressed ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
    color: color ?? ManagerColors.transparent,
    minWidth: minWidth ?? ManagerWidth.w16,
    height: height ?? ManagerHeight.h16,
    elevation: elevation ?? Constants.elevationButton,
    child: child,
  );
}