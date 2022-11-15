import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sketch_color_app/controllers/home_controller.dart';
import 'package:sketch_color_app/pages/home_page.dart';
import 'package:sketch_color_app/pages/login_page.dart';
import 'package:sketch_color_app/pages/splash_screen.dart';

import '../controllers/login_controller.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext? myContext = navigatorKey.currentState!.context;

appRoutes() {
  return <GetPage>[
    GetPage(
        name: LoginPage.id,
        page: () => const LoginPage(),
        binding: BindingsBuilder(() {
          Get.put(LoginController());
        })),
    GetPage(
        name: SplashScreen.id,
        page: () => const SplashScreen(),
        binding: BindingsBuilder(() {})),
    GetPage(
        name: MyHomePage.id,
        page: () => const MyHomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeController());
        })),
  ];
}
