import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sketch_color_app/pages/home_page.dart';
import 'package:sketch_color_app/pages/login_page.dart';

import '../common/user_defaults.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () => {gotoRelevantScreenOnUserType()});
  }

  void gotoRelevantScreenOnUserType() {
    if (UserDefaults.getCurrentUserId() != null) {
      Get.offAndToNamed(MyHomePage.id);
    } else {
      Get.offAndToNamed(LoginPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
