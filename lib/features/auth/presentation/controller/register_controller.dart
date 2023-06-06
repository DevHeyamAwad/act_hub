import 'package:act_hub/features/auth/domain/use_case/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_render/state_renderer.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';
import '../../../../core/widgets/dialog_button.dart';

class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();
  bool isAgreementPolicy = false;

  Future<void> register(BuildContext context) async {
    dialogRender(
      context: context,
      stateRenderType: StateRenderType.popUpLoadingState,
      message: ManagerStrings.loading,
      title: '',
      child: null,
      retryAction: null,
    );
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        name: fullName.text,
        email: email.text,
        password: password.text,
        confirmationPassword: confirmPassword.text,
        phone: phone.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
              message: ManagerStrings.ok,
              onPressed: () {
                Get.back();
              }),
        ),
        retryAction: null,
      );
    }, (r) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.thanks,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
            onPressed: () {
              Get.back();
            },
            message: ManagerStrings.thanks,
          ),
        ),
        retryAction: null,
      );
    });
  }

  changePolicyStatus() {}
}
