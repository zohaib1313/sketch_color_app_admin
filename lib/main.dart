import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sketch_color_app/pages/splash_screen.dart';

import 'common/app_route.dart';
import 'common/app_styles.dart';
import 'common/user_defaults.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserDefaults.getPref();
  runApp(const MyApplication());
}

///MyApplication
class MyApplication extends StatefulWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (_, __) => GetMaterialApp(
        getPages: appRoutes(),
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.whiteColor)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.whiteColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.whiteColor),
          ),
        )),
        fallbackLocale: const Locale('en', 'US'),
        localizationsDelegates: const [
          DefaultCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
