import 'package:act_hub/core/resources/manager_images.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/widgets/main_text.dart';
import 'package:act_hub/features/out_boarding/presentation/view/widget/slider_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w16,
            vertical: ManagerHeight.h10,
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: mainButton(
                    child: Text(
                  ManagerStrings.skip,
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.textColor,
                  ),
                )),
              ),
              SizedBox(height: ManagerHeight.h70),
              SvgPicture.asset(
                ManagerImages.outBoardingIllustration1,
                width: double.infinity,
                height: ManagerHeight.h206,
              ),
              SizedBox(height: ManagerHeight.h70),
              const SliderIndicator(),
              SizedBox(height: ManagerHeight.h50),
              Text(
                ManagerStrings.outBoardingTitle1,
                style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s34,
                  color: ManagerColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ManagerHeight.h20),
              Text(
                ManagerStrings.outBoardingSubTitle1,
                style: getTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.textColorLight,
                    weight: ManagerFontWight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ManagerHeight.h40),
              mainButton(child: const Icon(Icons.arrow_forward_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
