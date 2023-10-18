import 'package:doctorapp/health/about_us_screen.dart';
import 'package:doctorapp/health/data/DataFile.dart';
import 'package:doctorapp/health/home_sceens/body_mass_index.dart';
import 'package:doctorapp/health/home_sceens/pregnancy_duration_screen.dart';
import 'package:doctorapp/health/home_sceens/target_heart_screen.dart';
import 'package:doctorapp/health/home_sceens/water_intake_screen.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../routes/app_routes.dart';
import '../controller/controller.dart';
import '../model/RowItem.dart';
import '../model/ScreenArguments.dart';
import '../model/home_screen_data_model.dart';
import '../profile_screens/my_profile.dart';
import '../setting_ascreen.dart';
import '../utils/PrefData.dart';
import 'blood_alcohol_acreen.dart';
import 'blood_donation_screen.dart';
import 'blood_volume_screen.dart';
import 'body_fat_screen.dart';
import 'breath_count_screen.dart';
import 'calorias_for_screen.dart';
import 'ideal_weight_screen.dart';
import 'ovulation_period_screen.dart';

class HealthCalculatorScreen extends StatefulWidget {
  const HealthCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<HealthCalculatorScreen> createState() => _HealthCalculatorScreenState();
}

class _HealthCalculatorScreenState extends State<HealthCalculatorScreen> {
  int? themMode;
  void initState() {
    // TODO: implement initState
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    ConstantData.setThemePosition();
    super.initState();
  }
  getThemeMode() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
        (themMode == 1) ? ConstantData.bgColor : ConstantData.bgColor));
    themMode = await PrefData.getThemeMode();
    ConstantData.setThemePosition();
  }
  HomePageScreenController homePageScreenController =
  Get.put(HomePageScreenController());
  List<HomeScreenData> homeData = DataFile.getHomeData();
  RowItem? rowItem;
  List<RowItem> rowItemList = [];
  List screens = [

    IdealWeightScreen(),
    BodyMassIndexScreen(),
    BOdyFatScreen(),
    CaloriasForScreen(),
    WaterIntakeScreen(),
    TargetHeartScreen(),
    PregnancyDurationScreen(),
    OvulationPeriodScreen(),
    BloodVolumeScreen(),
    BloodDonationScreen(),
    BloodAlcoholScreen(),
    BreathCountScreen()

  ];
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    setState(() {
      rowItemList = DataFile.getCategoryModel(context);
    });
    return GetBuilder<HomePageScreenController>(
        init: HomePageScreenController(),
        builder: (homePageScreenController) {
          return Scaffold(
              backgroundColor:ConstantData.bgColor,

              appBar: ConstantWidget.getNoneAppbar(color: ConstantData.bgColor),

              // drawer: Drawer(
              //   backgroundColor: ConstantData.bgColor,
              //   child: DrawerWidget(),
              // ),
              body: SafeArea(
                child:Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 12,
                            color: ConstantData.shadowColor.withOpacity(0.20))
                      ], color: ConstantData.ContainerbgColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: getSvgImage("Back Arrow.svg",
                                  height: 35.h, width: 35.h)),
                          getCustomFont("Health calculation", 21.sp,
                              ConstantData.textColor, 1,
                              fontWeight: FontWeight.w700),
                          SizedBox()
                        ],
                      ).paddingSymmetric(horizontal: 20.h, vertical: 16.h),
                    ),
                    Expanded(
                        child: Container(
                          child:



                          GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding:
                            EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 162.h,
                                mainAxisSpacing: 24.h,
                                crossAxisSpacing: 20.h),
                            itemCount: homeData.length,
                            itemBuilder: (BuildContext context, int index) {
                              HomeScreenData data = homeData[index];
                              return  animation_function(index,  GestureDetector(
                                onTap: () async {
                                  rowItem = rowItemList[index];
                                  sendPage(rowItem!);
                                },

                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 130.h,
                                        child: Container(
                                            alignment: Alignment.bottomCenter,
                                            width: 166.h,
                                            child: getCustomFont(data.title, 17.sp,
                                                ConstantData.textColor, 1,
                                                fontWeight: FontWeight.w700,
                                                textAlign: TextAlign.center))
                                            .paddingOnly(
                                            bottom: 16.h, left: 10.h, right: 10.h),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        height: 115.h,
                                        width: 115.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(50.h),
                                              topLeft: Radius.circular(50.h),
                                              bottomLeft: Radius.circular(16.h),
                                              bottomRight: Radius.circular(16.h)),

                                        ),
                                        child: getSvgImage(data.icon).paddingAll(20.h),
                                      ),
                                    )
                                  ],
                                ),
                              ),listAnimation: Duration(seconds: 2));

                            },
                          ),
                        ).paddingOnly(bottom: 20.h))
                  ],
                ),
              ));
        }
    );
  }

  sendPage(RowItem? rowItem) {
    if (rowItem != null) {
      // print("pagfenae,-----${rowItem.pageName}");
      // if (rowItem.pageName!.isNotEmpty && rowItem.pageName != null) {
      //
      //   Navigator.pushNamed(
      //     context,
      //     "/" + rowItem.pageName!,
      //     arguments: ScreenArguments(rowItem),
      //   );
      // }

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AppRoutes.fromKey("/${rowItem.pageName}", rowItem);
      },));
    }
  }
}

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int? themMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                height: 48.h,
                width: 48.h,
                child: getAssetImage("user_image.png")),
            getHorSpace(16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont("John Abram", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w700),
                getVerSpace(4.h),
                getCustomFont("johnabram@gmail.com", 15.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400),
              ],
            )
          ],
        ),
        getVerSpace(16.h),
        Divider(color: ConstantData.lightGrayColor,),
        getVerSpace(16.h),
        get_data("my_profile_icon.svg", "My Profile", (){
          Navigator.push(
            context,
            PageTransition(
                type:PageTransitionType.scale,
                child: MyProfileScreen(),
                inheritTheme: true,
                alignment: Alignment.bottomCenter,
                ctx: context),
          );
        }),
        getVerSpace(32.h),
        get_data("setting_icon.svg", "Settings", (){
          Navigator.push(
            context,
            PageTransition(
                type:PageTransitionType.scale,
                child: SettingScreen(),
                inheritTheme: true,
                alignment: Alignment.bottomCenter,
                ctx: context),
          ).then((value){
            print("insede then===");
            setState(() {
              ConstantData.setThemePosition();
            });

          });
        }),
        getVerSpace(32.h),

        get_data("abut_us_icon.svg", "About us", (){
          Navigator.push(
            context,
            PageTransition(
                type:PageTransitionType.scale,
                child: AboutUsScreen(),
                inheritTheme: true,
                alignment: Alignment.bottomCenter,
                ctx: context),
          );
        }),

      ],
    ).paddingSymmetric(horizontal: 20.h,vertical: 41.h);
  }

  get_data(icon,title,function){
    return  GestureDetector(
      onTap: (){
        function();
      },
      child: Row(
        children: [
          getSvgImage(icon,color: ConstantData.textColor),
          getHorSpace(16.h),
          getCustomFont(title, 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400)
        ],
      ),
    );
  }
}
