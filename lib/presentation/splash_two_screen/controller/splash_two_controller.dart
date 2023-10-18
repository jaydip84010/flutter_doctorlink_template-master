import 'dart:async';

import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/splash_two_screen/models/splash_two_model.dart';

/// A controller class for the SplashTwoScreen.
///
/// This class manages the state of the SplashTwoScreen, including the
/// current splashTwoModelObj
class SplashTwoController extends GetxController {
  Rx<SplashTwoModel> splashTwoModelObj = SplashTwoModel().obs;



  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      _getIsFirst();
    });
  }

  _getIsFirst() async {
    bool isSignIn = await PrefUtils.getIsSignIn();
    bool isIntro = await PrefUtils.getIsIntro();
    Timer(const Duration(seconds: 3), () {
      print("is intro ====== ${isIntro}");
      print("isSignIn ====== ${isSignIn}");
      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingOneScreen);
      } else if (isSignIn) {
        Get.toNamed(AppRoutes.signInScreen);
      } else {
        Get.toNamed(AppRoutes.homePAgeContainer);

      }
    });
  }

}
