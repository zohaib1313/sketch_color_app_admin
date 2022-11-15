import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sketch_color_app/common/app_pop_ups.dart';
import 'package:sketch_color_app/pages/home_page.dart';

import '../common/app_route.dart';
import 'authenticaion_service.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    isLoading.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    var result = await AuthenticationService(FirebaseAuth.instance).signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    if (result) {
      Get.offAndToNamed(MyHomePage.id);
    } else {
      AppPopUps.showSnackBar(message: 'Failed to login', context: myContext!);
    }
    isLoading.value = false;
  }
}
