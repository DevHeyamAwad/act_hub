import 'package:act_hub/core/internet_checker/internet_checker.dart';
import 'package:act_hub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub/features/auth/data/login_repository_impl/login_repository_impl.dart';
import 'package:act_hub/features/auth/domain/repository/login_repository.dart';
import 'package:act_hub/features/auth/domain/use_case/login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../core/network/app_api.dart';
import '../core/network/dio_factory.dart';
import '../core/storage/local/app_settings_shared_preferences.dart';
import '../features/auth/presentation/controller/login_controller.dart';
import '../features/out_boarding/presentation/controller/out_boarding_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(
    () => AppApi(dio),
  );
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
        () => RemoteLoginDataSourceImplement(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance
        .registerLazySingleton<LoginRepository>(() => LoginRepositoryImplement(
              instance(),
              instance(),
            ));
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<LoginRepository>()));
  }
  Get.put<LoginController>(LoginController());
}
