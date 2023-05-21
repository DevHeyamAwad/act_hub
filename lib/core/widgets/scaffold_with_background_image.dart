import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_images.dart';

Widget scaffoldWithBackgroundImage(
    {required Widget child,
    Color backgroundColor = ManagerColors.primaryColor,
    String image = ManagerImages.background}) {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Center(
        child: child,
      ),
    ),
  );
}
