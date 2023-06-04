import 'package:act_hub_training/config/constants.dart';
import 'package:act_hub_training/core/resources/manager_assets.dart';
import 'package:act_hub_training/core/resources/manager_colors.dart';
import 'package:act_hub_training/core/resources/manager_fonts.dart';
import 'package:act_hub_training/core/resources/manager_sizes.dart';
import 'package:act_hub_training/core/resources/manager_strings.dart';
import 'package:act_hub_training/core/resources/manger_styles.dart';
import 'package:act_hub_training/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRenderType {
  popUpLoadingState,
  popUpErrorState,
  popUpSuccessState,
}

class StateRender extends StatelessWidget {
  StateRenderType stateRenderType;
  String message;
  String title;
  void Function()? retryAction = () {};

  StateRender({
    super.key,
    required this.stateRenderType,
    this.message = ManagerStrings.loading,
    this.title = '',
    this.retryAction,
  });

  @override
  Widget build(BuildContext context) {
    return getStateWidget(context);
  }

  Widget getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.popUpLoadingState:
        return popDialog(
          context,
          [
            animatedAsset(
              animatedAsset: ManagerJson.loading,
            ),
            getMessage(message),
          ],
        );
      case StateRenderType.popUpErrorState:
        return popDialog(
          context,
          [
            animatedAsset(
              animatedAsset: ManagerJson.error,
            ),
            getMessage(message),
            popUpButton(ManagerStrings.ok, retryAction),
          ],
        );
      case StateRenderType.popUpSuccessState:
        return popDialog(
          context,
          [
            animatedAsset(
              animatedAsset: ManagerJson.success,
            ),
            getMessage(title),
            getMessage(message),
            popUpButton(ManagerStrings.ok, retryAction),
          ],
        );
      default:
        return Container();
    }
  }

  Padding popUpButton(String title, onPressed) {
    return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w18,
              vertical: ManagerHeight.h18,
            ),
            child: SizedBox(
              child: mainButton(
                minWidth: ManagerWidth.w100,
                height: ManagerHeight.h48,
                color: ManagerColors.primaryColor,
                child: Text(
                  title,
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.white,
                  ),
                ),
                onPressed: onPressed,
              ),
            ),
          );
  }

  Dialog popDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r14,
        ),
      ),
      elevation: Constants.getStateWidgetRenderStateElevation,
      backgroundColor: ManagerColors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ManagerColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r14,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: dialogContent(
          context,
          children,
        ),
      ),
    );
  }

  Column dialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Padding getMessage(String message) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w8,
        vertical: ManagerHeight.h8,
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: getRegularTextStyle(
          fontSize: ManagerFontSize.s18,
          color: ManagerColors.black,
        ),
      ),
    );
  }

  SizedBox animatedAsset({
    required String animatedAsset,
  }) {
    return SizedBox(
      height: ManagerHeight.h100,
      width: ManagerWidth.w100,
      child: Lottie.asset(animatedAsset),
    );
  }
}

dialogRender({
  required BuildContext context,
  required StateRenderType stateRenderType,
  required String message,
  required String title,
  required retryAction,
}) {
  showDialog(
    context: context,
    builder: (context) => StateRender(
      stateRenderType: stateRenderType,
      message: message,
      title: title,
      retryAction: retryAction,
    ),
  );
}
