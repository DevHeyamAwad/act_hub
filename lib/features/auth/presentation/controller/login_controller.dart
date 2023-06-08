import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_render/state_renderer.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../domain/use_case/login_use_case.dart';

class LoginController extends GetxController {
  late TextEditingController email =
      TextEditingController(text: 'user1@acthub.com');
  late TextEditingController password =
      TextEditingController(text: 'user1@acthub.com');
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  bool rememberMe = false;

  changeRememberMe(bool status) {
    rememberMe = status;
    update();
  }

  void performLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _login(context);
    }
  }

  Future<void> _login(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});
    (await _loginUseCase.execute(
      LoginUseCaseInput(email: email.text, password: password.text),
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
      );
    }, (r) {
      if (rememberMe) {
        _appSettingsSharedPreferences.setEmail(email.text);
        _appSettingsSharedPreferences.setPassword(password.text);
        _appSettingsSharedPreferences.setLoggedIn();
      }
      _appSettingsSharedPreferences.setToken(r.token.onNull());
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
              Get.offAllNamed(Routes.mainView);
            },
            message: ManagerStrings.thanks,
          ),
        ),
      );
      Future.delayed(
          const Duration(
            seconds: Constants.loginTimer,
          ), () {
        Get.offAllNamed(Routes.mainView);
      });
    });
  }
}
