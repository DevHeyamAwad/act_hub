import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_images.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ManagerImages.background), fit: BoxFit.cover),
        ),
        child: Center(
          child: SvgPicture.asset(ManagerImages.logo, width: ManagerWidth.w166),
        ),
      ),
    );
  }
}
