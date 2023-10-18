  import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String age = "healthAge";
  static String gender = "healthGender";
  static String healthheartrate = "healthheartrate";
  static String centimeter = "healthCentimeter";
  static String kilogram = "healthKilogram";
  static String intro = "healthIntro";
  static String height = "healthHeight";
  static String weight = "healthWeight";
  static String targetweight = "healthtargetweight";
  static String waist = "healthwaist";
  static String neck = "healthNeck";
  static String weightscreen = "healthWeightscreen";
  static String heightscreen = "healthHeightscreen";
  static String genderscreen = "healthGenderscreen";
  static String click = "healthClick";
  static String isAppPurchased = "isAppPurchased";
  static String isAdsPermission = "isAdsPermission";
  static String isDarkTheme = "isDarkTheme";

  static int defaultAge = 25;
   static double defaultHeight = 1.53;
   static double defaultWeight = 30;
   static double defaultTargetWeight = 10;
   static double defaultwaist = 94;
   static double defaultneck = 14;
   static bool defaultWeightscreen = true;
   static bool defaultHeightscreen = true;
   static bool defaultgenderscreen = true;
   static bool defaultDarkTheme = false;
  static String mode ="modeScreen";


  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key)
    ;
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key)
    ;
  }
  static setThemeMode(int isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(mode, isFav);
  }

  static getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(mode) ?? 0;
  }




  static setIsAppAdsPermission(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isAdsPermission, s);
  }

  static getIsAppAdsPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isAdsPermission) ?? false;
  }







  static setClick(int s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(click, s);
  }

  static getClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(click) ?? 0;
  }
  static setAge(int s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(age, s);
  }

  static getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(age) ?? defaultAge;
  }

  static setHeight(double s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(height, s);
  }

  static getHeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(height) ?? defaultHeight;
  }

  static setWeight(double s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(weight, s);
  }

  static getWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(weight) ?? defaultWeight;
  }

  static setTargetWeight(double s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(targetweight, s);
  }

  static getTargetWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(targetweight) ?? defaultTargetWeight;
  }

  static setWaistsize(double s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(waist, s);
  }

  static getWaistsize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(waist) ?? defaultwaist;
  }



  static setNecksize(double s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(neck, s);
  }

  static getNecksize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(neck) ?? defaultneck;
  }



  static setWeightScreen(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(weightscreen, s);
  }

  static getWeightScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(weightscreen) ?? defaultWeightscreen;
  }

  static setTheme(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkTheme, s);
  }

  static getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkTheme) ?? defaultDarkTheme;
  }

  static setGenderScreen(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(genderscreen, s);
  }

  static getGenderScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(genderscreen) ?? defaultgenderscreen;
  }

  static setHeightScreen(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(heightscreen, s);
  }

  static getHeightScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(heightscreen) ?? defaultHeightscreen;
  }


  static setGender(int s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(gender, s);
  }

  static getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(gender) ?? 0;
  }


  static setHeartRate(int s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(healthheartrate, s);
  }

  static getHeartRate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(healthheartrate) ?? 72;
  }


  static setCM(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(centimeter, s);
  }

  static getCM() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(centimeter) ?? false;
  }


  static setKG(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kilogram, s);
  }

  static getKG() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kilogram) ?? false;
  }




  static setIntro(bool s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(intro, s);
  }

  static getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(intro) ?? true;
  }

}
