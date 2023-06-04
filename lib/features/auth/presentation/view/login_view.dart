import 'package:act_hub/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:act_hub/core/widgets/scaffold_with_background_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_feild.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackGroundImage(
        child: Column(
      children: [
        Expanded(
          flex: Constants.loginFirstPartFlex,
          child: Container(
            margin: EdgeInsetsDirectional.only(top: ManagerHeight.h12),
            alignment: Alignment.center,
            child: SvgPicture.asset(ManagerAssets.logo),
          ),
        ),
        Expanded(
          flex: Constants.loginSecondPartFlex,
          child: Container(
            decoration: BoxDecoration(
              color: ManagerColors.backgroundForm,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  ManagerRadius.r44,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w16,
              vertical: ManagerHeight.h30,
            ),
            width: double.infinity,
            child: GetBuilder<LoginController>(
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Text(
                        ManagerStrings.login,
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s24,
                          color: ManagerColors.black,
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h30),
                      baseTextFormField(
                        controller: controller.email,
                        hintText: ManagerStrings.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => _failedValidator.validateEmail(
                          value,
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      baseTextFormField(
                        controller: controller.password,
                        hintText: ManagerStrings.password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) => _failedValidator.validatePassword(
                          value,
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h80),
                      mainButton(
                          child: Text(
                            ManagerStrings.login,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.white,
                            ),
                          ),
                          minWidth: double.infinity,
                          color: ManagerColors.primaryColor,
                          height: ManagerHeight.h40,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.login();
                            }
                          })
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
