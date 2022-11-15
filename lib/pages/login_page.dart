import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sketch_color_app/common/app_styles.dart';
import 'package:sketch_color_app/common/common_widgets.dart';

import '../common/loading_widget.dart';
import '../common/spaces_boxes.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const id = '/LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(
        initState: (_) {},
        builder: (logic) {
          controller.isLoading.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text('Login',
                                style: AppTextStyles.textStyleBoldTitleLarge),
                          ),
                          vSpace,
                          vSpace,
                          MyTextField(
                            controller: controller.emailController,
                            labelText: 'Email',
                            fillColor: AppColor.alphaGrey,
                            validator: (s) {
                              if ((s ?? '').isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          vSpace,
                          vSpace,
                          MyTextField(
                            controller: controller.passwordController,
                            labelText: 'Password',
                            fillColor: AppColor.alphaGrey,
                            validator: (s) {
                              if ((s ?? '').isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          vSpace,
                          vSpace,
                          vSpace,
                          vSpace,
                          Button(
                            buttonText: 'Login',
                            onTap: () {
                              if (controller.formKey.currentState?.validate() ??
                                  false) {
                                controller.login();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.isLoading.isTrue) LoadingWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
