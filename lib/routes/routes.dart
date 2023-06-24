import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';
import '../config/dependency_injection.dart';
import '../features/forget_password/presentation/view/forget_pass_view.dart';
import '../features/home/presentation/view/home_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
  static const String verificationView = '/verification_view';
  static const String mainView = '/main_view';
  static const String homeView = '/home_view';
  static const String registerView = '/register_view';
  static const String forget_password = '/forget_password_view';
  static const String reset_password = '/reset_password';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.loginView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.verificationView:
        initVerificationModule();
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case Routes.mainView:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.forget_password:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => ForgetPassView());
      case Routes.reset_password:
        initResetPasswordModule();
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRoutFound),
        ),
      ),
    );
  }
}
