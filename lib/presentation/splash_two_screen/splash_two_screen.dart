import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/splash_two_controller.dart';

class SplashTwoScreen extends StatefulWidget {
  const SplashTwoScreen({Key? key}) : super(key: key);

  @override
  State<SplashTwoScreen> createState() => _SplashTwoScreenState();
}

class _SplashTwoScreenState extends State<SplashTwoScreen> {
  SplashTwoController controller = Get.put(SplashTwoController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: ColorfulSafeArea(
            child: Scaffold(
                body: Image.asset(
          "assets/images/splash_1.png",
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ))));
  }
}
