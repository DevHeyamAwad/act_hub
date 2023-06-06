import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../config/dependency_injection.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';

class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<void> register(BuildContext context) async {}
}
