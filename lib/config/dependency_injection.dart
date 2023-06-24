import 'package:act_hub/core/internet_checker/internet_checker.dart';
import 'package:act_hub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:act_hub/features/auth/data/login_repository_impl/login_repository_impl.dart';
import 'package:act_hub/features/auth/data/login_repository_impl/register_repository_impl.dart';
import 'package:act_hub/features/auth/domain/repository/login_repository.dart';
import 'package:act_hub/features/auth/domain/repository/register_repository.dart';
import 'package:act_hub/features/auth/domain/use_case/login_use_case.dart';
import 'package:act_hub/features/auth/domain/use_case/register_use_case.dart';
import 'package:act_hub/features/main/presentation/controller/main_controller.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../core/network/app_api.dart';
import '../core/network/dio_factory.dart';
import '../core/storage/local/app_settings_shared_preferences.dart';
import '../core/storage/remote/firebase/controllers/fb_notifications.dart';
import '../features/auth/presentation/controller/login_controller.dart';
import '../features/auth/presentation/controller/register_controller.dart';
import '../features/home/data/data_source/remote_home_data_source.dart';
import '../features/home/data/repository_implementation/home_repositpry_implementation.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/home/domain/usecase/home_usecase.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/out_boarding/presentation/controller/out_boarding_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../firebase_options.dart';

final instance = GetIt.instance;

firebaseModule() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FbNotifications fb = FbNotifications();
  await FbNotifications.initNotifications();
  await fb.requestNotificationPermissions();
  await fb.initializeForegroundNotificationForAndroid();
  fb.manageNotificationAction();
  print('object');
  print(await FirebaseMessaging.instance.getToken());
}

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseModule();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  // TODO: ONLY FOR TEST
  // AppSettingsSharedPreferences appSettingsSharedPreferences =
  //     instance<AppSettingsSharedPreferences>();
  // appSettingsSharedPreferences.clear();

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
  disposeSplash();
  disposeOutBoarding();
  disposeRegisterModule();
  // initVerificationModule();
  // initFcmToken();
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance<LoginRepository>(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}

disposeLoginModule() {
  // disposeFcmToken();

  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() {
  disposeLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
      () => RemoteRegisterDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(
        instance<RemoteRegisterDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        instance<RegisterRepository>(),
      ),
    );
  }

  Get.put<RegisterController>(RegisterController());
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }

  Get.delete<RegisterController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHomeModule();
}

initHomeModule() {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        instance<RemoteHomeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
}

// initVerificationModule() {
//   initSendOtp();

//   if (!GetIt.I.isRegistered<RemoteVerificationDataSource>()) {
//     instance.registerLazySingleton<RemoteVerificationDataSource>(
//       () => RemoteVerificationDataSourceImplementation(
//         instance<AppApi>(),
//       ),
//     );
//   }

//   if (!GetIt.I.isRegistered<VerificationRepository>()) {
//     instance.registerLazySingleton<VerificationRepository>(
//       () => VerificationRepositoryImpl(
//         instance<NetworkInfo>(),
//         instance<RemoteVerificationDataSource>(),
//       ),
//     );
//   }

//   if (!GetIt.I.isRegistered<VerificationUseCase>()) {
//     instance.registerLazySingleton<VerificationUseCase>(
//       () => VerificationUseCase(
//         instance<VerificationRepository>(),
//       ),
//     );
//   }

//   Get.put<VerificationController>(VerificationController());
// }

// initForgetPassword() async {
//   disposeLoginModule();
//   initSendOtp();

//   if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
//     instance.registerLazySingleton<ForgetPasswordDataSource>(
//         () => RemoteForgetPasswordDataSourceImpl(instance<AppApi>()));
//   }

//   if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
//     instance.registerLazySingleton<ForgetPasswordRepository>(
//         () => ForgetPasswordRepositoryImpl(instance(), instance()));
//   }

//   if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
//     instance.registerFactory<ForgetPasswordUseCase>(
//         () => ForgetPasswordUseCase(instance<ForgetPasswordRepository>()));
//   }

//   Get.put<ForgetPasswordController>(ForgetPasswordController());
// }

// disposeForgetPassword() async {
//   if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
//     instance.unregister<ForgetPasswordDataSource>();
//   }

//   if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
//     instance.unregister<ForgetPasswordRepository>();
//   }

//   if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
//     instance.unregister<ForgetPasswordUseCase>();
//   }
// }

// initResetPasswordModule() {
//   if (!GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
//     instance.registerLazySingleton<ResetPasswordRemoteDataSource>(
//       () => RemoteResetPasswordRemoteDataSourceImpl(
//         instance<AppApi>(),
//       ),
//     );
//   }

//   if (!GetIt.I.isRegistered<ResetPasswordRepository>()) {
//     instance.registerLazySingleton<ResetPasswordRepository>(
//       () => ResetPasswordRepositoryImpl(
//         instance<NetworkInfo>(),
//         instance<ResetPasswordRemoteDataSource>(),
//       ),
//     );
//   }

//   if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
//     instance.registerLazySingleton<ResetPasswordUseCase>(
//       () => ResetPasswordUseCase(
//         instance<ResetPasswordRepository>(),
//       ),
//     );
//   }

//   Get.put<ResetPasswordController>(ResetPasswordController());
// }

// disposeResetPasswordModule() {
//   disposeForgetPassword();
//   if (GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
//     instance.unregister<ResetPasswordRemoteDataSource>();
//   }

//   if (GetIt.I.isRegistered<ResetPasswordRepository>()) {
//     instance.unregister<ResetPasswordRepository>();
//   }

//   if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
//     instance.unregister<ResetPasswordUseCase>();
//   }

//   Get.delete<ResetPasswordController>();
// }

// initSendOtp() async {
//   if (!GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
//     instance.registerLazySingleton<RemoteSendOtpDataSource>(
//         () => RemoteSendOtpDataSourceImpl(instance<AppApi>()));
//   }

//   if (!GetIt.I.isRegistered<SendOtpRepository>()) {
//     instance.registerLazySingleton<SendOtpRepository>(
//         () => SendOtpRepositoryImpl(instance(), instance()));
//   }

//   if (!GetIt.I.isRegistered<SendOtpUseCase>()) {
//     instance.registerFactory<SendOtpUseCase>(
//         () => SendOtpUseCase(instance<SendOtpRepository>()));
//   }
// }

// disposeSendOtp() async {
//   if (GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
//     instance.unregister<RemoteSendOtpDataSource>();
//   }

//   if (GetIt.I.isRegistered<SendOtpRepository>()) {
//     instance.unregister<SendOtpRepository>();
//   }

//   if (GetIt.I.isRegistered<SendOtpUseCase>()) {
//     instance.unregister<SendOtpUseCase>();
//   }
// }

// initFcmToken() async {
//   if (!GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
//     instance.registerLazySingleton<RemoteFcmTokenDataSource>(
//         () => RemoteFcmTokenDataSourceImplement(instance<AppApi>()));
//   }

//   if (!GetIt.I.isRegistered<FcmTokenRepository>()) {
//     instance.registerLazySingleton<FcmTokenRepository>(
//         () => FcmTokenRepositoryImpl(instance(), instance()));
//   }

//   if (!GetIt.I.isRegistered<FcmTokenUseCase>()) {
//     instance
//         .registerFactory<FcmTokenUseCase>(() => FcmTokenUseCase(instance()));
//   }
// }

// disposeFcmToken() async {
//   if (GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
//     instance.unregister<RemoteFcmTokenDataSource>();
//   }

//   if (GetIt.I.isRegistered<FcmTokenRepository>()) {
//     instance.unregister<FcmTokenRepository>();
//   }

//   if (GetIt.I.isRegistered<FcmTokenUseCase>()) {
//     instance.unregister<FcmTokenUseCase>();
//   }
// }
