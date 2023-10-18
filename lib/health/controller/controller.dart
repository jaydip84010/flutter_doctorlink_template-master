
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/ConstantData.dart';

class HomePageScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changeTheme();
  }

  changeTheme()async{
    isDarkTheme.value = await PrefData.getThemeMode();
    ConstantData.setThemePosition();
    update();
  }
}

class MyProfileScreenController extends GetxController {
  String gender = '';
  double weightcmToMeter = 10.10;
  double height = 10.10;

  void setGender(String s) {
    gender = s;
    update();
  }

  void setHeight(double cmToMeter) {
    weightcmToMeter = cmToMeter;
    update();
  }

  void setweight(double roundToDouble) {
    height = roundToDouble;
    update();
  }
}

class SettingScreenController extends GetxController {
  bool currentTheme = false;
  bool notification = true;

  void onSetTheme() {
    currentTheme = !currentTheme;
    update();
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      PrefData.setThemeMode(1);
      update();
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      PrefData.setThemeMode(0);
      update();
    }
  }
}
