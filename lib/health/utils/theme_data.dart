import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:flutter/material.dart';

import 'PrefData.dart';
class Themes with ChangeNotifier{
  static final light = ThemeData.light().copyWith(
   bottomAppBarTheme: BottomAppBarTheme(color: ConstantData.textColor),
    scaffoldBackgroundColor: ConstantData.bgColor,



   primaryColor: ConstantData.textColor,

    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.cyan),
    )),
    elevatedButtonTheme:ElevatedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.cyan),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.cyan),
    )),



    focusColor: Colors.white,

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,

    ),
  );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0XFF111014),
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
    )),
    elevatedButtonTheme:ElevatedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
    )),
    primaryColor: ConstantData.bgColor,
    focusColor: Color(0XFF28282D),

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  ThemeNotifier() {
    PrefData.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';

      if (themeMode == 'light') {
        light.colorScheme.copyWith(
          secondary: Colors.black,
        );

      } else {
        print('setting dark theme');

        dark.colorScheme.copyWith(secondary: Colors.white);

      }
      notifyListeners();
    });
  }
  void setDarkMode() async {
    dark.colorScheme.copyWith(secondary: Colors.white,);
    PrefData.saveData('themeMode', 'dark');
    notifyListeners();

  }

  void setLightMode() async {
    light.colorScheme.copyWith(secondary: Colors.black);

    PrefData.saveData('themeMode', 'light');
    notifyListeners();
  }
}