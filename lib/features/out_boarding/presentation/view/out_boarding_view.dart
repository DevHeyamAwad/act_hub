import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/widgets/main_text.dart';
import 'package:flutter/material.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w20,
              vertical: ManagerHeight.h16,
            ),
            color: Colors.red,
            child: Column(children: const [
              Align(
                  alignment: AlignmentDirectional.centerEnd, child: MainText())
            ]),
          ),
        ));
  }
}
