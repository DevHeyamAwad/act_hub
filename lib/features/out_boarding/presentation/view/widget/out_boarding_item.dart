import 'package:act_hub/core/resources/manager_images.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutBoardingItem extends StatelessWidget {
  const OutBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ManagerHeight.h70,
        ),
        SvgPicture.asset(ManagerImages.outBoardingIllustration1),
        SizedBox(
          height: ManagerHeight.h70,
        )
      ],
    );
  }
}
