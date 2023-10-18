import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/model/ScreenArguments.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';

import 'PrefData.dart';





 ValueNotifier<int> isDarkTheme = ValueNotifier(0);

class ConstantData {
  static String themeIcon = "radio_button_unselected.svg";
  static Color primaryColor = "#FFFFFF".toColor();
  static Color shadowColor = "#AEADBB".toColor();
  static Color idealweightColor = "#FFC6FB".toColor();
  static Color bodymassindexColor = "#FFE99A".toColor();
  static Color bodyfatColor = "#A5F8DA".toColor();
  static Color bodyfatChartDataColor = "#A5F8DA".toColor();
  static Color caloriasColor = "#CCD1FB".toColor();
  static Color caloriasChartColor = "#CCD1FB".toColor();
  static Color waterintakeColor = "#FBC5C5".toColor();
  static Color waterintakeChartDataColor = "#FBC5C5".toColor();
  static Color targetheartColor = "#B3EDB8".toColor();
  static Color pregnancydurationColor = "#DDE7A8".toColor();
  static Color pregnancydurationChartDataColor = "#DDE7A8".toColor();
  static Color ovulationperiodColor = "#B0EBEF".toColor();
  static Color ovulationperiodChartDAtaColor = "#B0EBEF".toColor();
  static Color bloodvolumeColor = "#DFC7F6".toColor();
  static Color blooddonationColor = "#F3C3E9".toColor();
  static Color blooddonationChartDataColor = "#F3C3E9".toColor();
  static Color bloodalcoholColor = "#FEC998".toColor();
  static Color breathcountColor = "#F1BBAF".toColor();
  static Color lightPurpleColor = "#F1F0FF".toColor();
  static Color tabContainerBgColor = "#F5F6F6".toColor();//1A1A1C
  static Color tabContainerItemBgColor = "#FFFFFF".toColor();//28282D
  static Color textfieldBorder = "#D2DCE3".toColor();//4A4A55
  static Color lightGrayColor = "#F2F2F2".toColor();//28282D
  static Color blackColor = "#000000".toColor();
  static Color grayColor = "#606060".toColor();
  static Color myprofilegrayTextColor = "#606060".toColor();
  static Color lightgrayColor = "#EBECEF".toColor();//26262C
  static Color accentColor = "#7B6FF2".toColor();
  static Color bgColor = "#FFFFFF".toColor();
  static Color iconContainerBg = "#FFFFFF".toColor();//333333
  static Color ContainerbgColor = "#FFFFFF".toColor();//
  static Color defaultColor = "#F3BC3D".toColor();
  static Color textColor = "#333333".toColor();//
  static Color hintColor = "#606060".toColor();//848587
  static Color appbarBgColor = "#ffffff".toColor();//1A1A1C
  static Color color1 = "#F96F26".toColor();
  static Color color2 = "#5C8FED".toColor();
  static Color color3 = "#F3BC3D".toColor();
  static Color color4 = "#29AFD3".toColor();
  static Color color5 = "#B248C7".toColor();
  static Color color6 = "#3D739F".toColor();
  static Color color7 = "#F96F26".toColor();
  static Color color8 = "#5C8FED".toColor();
  static Color color9 = "#F3BC3D".toColor();
  static Color color10 = "#29AFD3".toColor();
  static Color color11 = "#B248C7".toColor();
  static Color color12 = "#3D739F".toColor();
  static Color color13 = "#F96F26".toColor();
  static Color color14 = "#5C8FED".toColor();
  static Color color15 = "#F3BC3D".toColor();
  static String privacyPolicy =
      "http://victorytemplate.com/PrivacyPolicy.html/";

  static String fontFamily = "SF UI Text";
  static String assetsPath = "assets/health/images/";
  static String pdfPath = "assets/health/pdf/";
  static String calculate = "1";
  static String reset = "2";
  static String chart = "3";
  static String information = "4";







  static setThemePosition() async {
    int themMode = await PrefData.getThemeMode();
    isDarkTheme.value = await PrefData.getThemeMode();

    print("themeMode-----$themMode");

    if (themMode == 1) {
      themeIcon = "radio_button_selected.svg";
      waterintakeChartDataColor = "#000000".toColor();
      shadowColor = "#111014".toColor();
      lightgrayColor = "#26262C".toColor();//
      bgColor = "#111014".toColor();
      blooddonationChartDataColor = "#000000".toColor();
      ovulationperiodChartDAtaColor = "#000000".toColor();
      pregnancydurationChartDataColor = "#000000".toColor();
      caloriasChartColor = "#000000".toColor();
      bodyfatChartDataColor = "#000000".toColor();
      appbarBgColor = "#1A1A1C".toColor();//1A1A1C
      iconContainerBg = "#333333".toColor();//
      textColor = "#ffffff".toColor();
      grayColor = "#606060".toColor();
      lightGrayColor = "#28282D".toColor();//
      tabContainerBgColor = "#1A1A1C".toColor();//1A1A1C
      tabContainerItemBgColor = "#28282D".toColor();//28282D
      textfieldBorder = "#4A4A55".toColor();//4A4A55
      hintColor = "#848587".toColor();//848587
      ContainerbgColor = "#28282D".toColor();//28282D
      myprofilegrayTextColor = "#ffffff".toColor();


      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.black));
    } else {
      themeIcon = "radio_button_unselected.svg";
      myprofilegrayTextColor = "#606060".toColor();
      waterintakeChartDataColor = "#FBC5C5".toColor();
      shadowColor = Color(0XFFAEADBB).withOpacity(0.20);
      caloriasChartColor = "#CCD1FB".toColor();
      lightgrayColor = "#EBECEF".toColor();//26262C
      bgColor = "#FFFFFF".toColor();
      blooddonationChartDataColor = "#F3C3E9".toColor();
      ovulationperiodChartDAtaColor = "#B0EBEF".toColor();
      pregnancydurationChartDataColor = "#DDE7A8".toColor();
      bodyfatChartDataColor = "#A5F8DA".toColor();
      appbarBgColor = "#ffffff".toColor();//1A1A1C
      iconContainerBg = "#FFFFFF".toColor();//333333
      textColor = "#000000".toColor();
      grayColor = "#606060".toColor();
      lightGrayColor = "#F2F2F2".toColor();//28282D
      tabContainerBgColor = "#F5F6F6".toColor();//1A1A1C
      tabContainerItemBgColor = "#FFFFFF".toColor();//28282D
      textfieldBorder = "#D2DCE3".toColor();//4A4A55
      hintColor = "#606060".toColor();//848587
      ContainerbgColor = "#FFFFFF".toColor();//28282D

      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: bgColor));
    }
  }


  static RowItem getThemeColor(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return args.rowItem;
  }

  static Future<void> shareApp(BuildContext contexts) async {


    String appLink = await getAppLink();
    await FlutterShare.share(
      title: S.of(contexts).appName,
      text: 'Share us',
      linkUrl: appLink,
      chooserTitle: 'Example Chooser Title',
    );
  }

  static Future<String> getAppLink() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String packageName = packageInfo.packageName;
    String buildNumber = '87687567';

    print("packageName===$packageName===$buildNumber");

    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=$packageName";
    } else if (Platform.isIOS) {
      return "https://apps.apple.com/us/app/apple-store/id$buildNumber";
    }
    return "";
  }

  static String getFormattedDate(DateTime now) {
    var formatter = new DateFormat('dd MMMM yyyy');
    return formatter.format(now);
  }

  static String getDefaultDate(DateTime now) {
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  static launchEmail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';

    await launchUrl(Uri.parse(url));

  }

  static launchURL(String url) async {

    await launchUrl(Uri.parse(url));

  }

  static double meterToCm(double meter) {
    return meter * 100;
  }

  static String formatData(double meter) {
    var f = new NumberFormat(".##", "en_US");

    return f.format(meter);
  }

  static double kgToPound(double kg) {
    return (kg * 2.205);
  }

  static double cmtoinches(double cm){
    return(cm * 0.393701);
  }
  static double inchestocm(double inch){
    return(inch * 2.54);
  }


  static double cmToMeter(double v) {
    return v / 100;
  }

  static showToast(String s, BuildContext context) {
    if (s.isNotEmpty) {
      Fluttertoast.showToast(
          msg: s,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);


    }
  }

  static void meterToInchAndFeet(
      double meter,
      TextEditingController ftController,
      TextEditingController inchController) {
    double inch = (meter * 39.37);
    double ft1 = inch / 12;
    int n = ft1.toInt();
    double in1 = ft1 - n;
    double in2;
    in2 = in1 * 12;

    ftController.text = n.round().toString();
    inchController.text = in2.round().toString();
  }

  static bool check(String s) {
    return s.isNotEmpty;
  }

  static double feetAndInchToMeter(int feet, int inch) {
    double meter;
    double f1 = (feet / 3.281);
    double i1 = (inch / 39.37);
    meter = f1 + i1;
    return meter;
  }

  static double poundToKg(double pound) {
    return (pound / 2.205);
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

///
