import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:doctorapp/health/home_sceens/body_fat_screen.dart';
import 'package:doctorapp/health/home_sceens/body_mass_index.dart';
import 'package:doctorapp/health/home_sceens/calorias_for_screen.dart';
import 'package:doctorapp/health/home_sceens/ideal_weight_screen.dart';
import 'package:doctorapp/health/home_sceens/water_intake_screen.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';

import 'core/app_export.dart';
import 'package:doctorapp/generated/l10n.dart';

import 'health/home_sceens/blood_alcohol_acreen.dart';
import 'health/home_sceens/blood_donation_screen.dart';
import 'health/home_sceens/blood_volume_screen.dart';
import 'health/home_sceens/breath_count_screen.dart';
import 'health/home_sceens/ovulation_period_screen.dart';
import 'health/home_sceens/pregnancy_duration_screen.dart';
import 'health/home_sceens/target_heart_screen.dart';
import 'health/page/BloodPressurePage.dart';
import 'health/utils/ConstantData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
    ),
  );
  MobileAds.instance.initialize();
  isDarkTheme.value = await PrefData.getThemeMode();

  try {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;

    if (status == TrackingStatus.notDetermined) {

      PrefData.setIsAppAdsPermission(false);

      await AppTrackingTransparency.requestTrackingAuthorization()
          .then((value) async {
        final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
        if (status != TrackingStatus.notDetermined) {
          PrefData.setIsAppAdsPermission(true);
        } else {
          PrefData.setIsAppAdsPermission(false);
        }
      });
    } else {
      PrefData.setIsAppAdsPermission(true);
    }
  } on PlatformException {}

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
          visualDensity: VisualDensity.standard,
          elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: ColorConstant.whiteA700),
          dialogTheme: DialogTheme(
              backgroundColor: ColorConstant.whiteA700, surfaceTintColor: ColorConstant.whiteA700)
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],



      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'doctorapp',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }

  getPage(var page, var settings) {
    return PageTransition(
      child: page,
      type: PageTransitionType.scale,
      settings: settings,
      alignment: Alignment.bottomCenter,
    );
  }

}
