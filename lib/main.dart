import 'package:act_hub/config/constants.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/service/theme_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp({super.key}) : _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(Constans.deviceWidth, Constans.deviceHeight),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashView,
            theme: _themeService.getThemeData(),
          );
        });
  }
}
