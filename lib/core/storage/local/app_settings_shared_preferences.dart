import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;
  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
        ConstantsPrefsKeys.outBoardingViewedKey, true);
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(ConstantsPrefsKeys.outBoardingViewedKey)
        .onNull();
  }
}
