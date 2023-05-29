import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:dio/dio.dart';

import '../resources/manager_strings.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    final AppSettingsSharedPreferences appSettingsPreferences =
        instance<AppSettingsSharedPreferences>();
    Map<String, String> headers = {
      ApiConstants.authorization:
          getAuthorization(appSettingsPreferences.getToken())
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(seconds: Constants.timeOutDuration),
      sendTimeout: const Duration(seconds: Constants.timeOutDuration),
    );
  }

  String getAuthorization(String token) {
    return '${ManagerStrings.bearer} $token';
  }
}
