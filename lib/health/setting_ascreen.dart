import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import 'about_us_screen.dart';
import 'controller/controller.dart';
import 'feedback_screen.dart';
import 'package:doctorapp/generated/l10n.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingScreenController settingScreenController  = Get.put(SettingScreenController());
  double star = 3.0;
  int? themMode;


  getThemeMode() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
        (themMode == 1) ? ConstantData.bgColor : ConstantData.bgColor));
    themMode = await PrefData.getThemeMode();
    ConstantData.setThemePosition();
  }
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return  GetBuilder<SettingScreenController>(
      init: SettingScreenController(),
      builder:(settingScreenController) =>  WillPopScope(
        child: Scaffold(
          backgroundColor:ConstantData.bgColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 22,
                          color: ConstantData.shadowColor.withOpacity(0.20)
                      )
                    ],
                    color: ConstantData.bgColor
                ),child: appBar((){
                  Get.back();
                  Get.back();
                },text: "Settings",).paddingSymmetric(vertical: 16.h,horizontal: 20.h)),
                Expanded(
                  child: Column(
                    children: [
                      getVerSpace(24.h),
                      settings_option("privacy_policy_icon.svg", "Privacy policy", (){
                        ConstantData.launchURL(ConstantData.privacyPolicy);
                      }),
                      getVerSpace(24.h),
                      settings_option("share_icon.svg", "Share", (){ ConstantData.shareApp(context);}),
                      getVerSpace(24.h),
                      settings_option("rate_us_icon.svg", "Rate us", (){


                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                              ConstantData.bgColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(22.h)),
                              contentPadding: EdgeInsets.zero,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                      child: getCustomFont(
                                          "Give Your Opinion",
                                          17.sp,
                                          ConstantData.textColor,
                                          1,
                                          fontWeight: FontWeight.w700,
                                      )),
                                 getVerSpace(16.h),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      child: getMultilineCustomFont( "Make better math goal for you, and would love to know how would rate our app?", 15.sp, ConstantData.grayColor,
                            textAlign: TextAlign.center,
                            txtHeight: 1.5.h,
                                      fontWeight: FontWeight.w400)





                            ),
                                 getVerSpace(24.h),
                                  RatingBar(
                                    initialRating: 3,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 32,
                                    glow: false,
                                    ratingWidget: RatingWidget(
                                        full: Image(
                                            image: AssetImage(
                                                ConstantData.assetsPath +
                                                    "fidbackfillicon.png")),
                                        half: Image(
                                          image: AssetImage(
                                              ConstantData.assetsPath +
                                                  "fidbackemptyicon.png"),
                                        ),
                                        empty: Image(
                                          image: AssetImage(
                                              ConstantData.assetsPath +
                                                  "fidbackemptyicon.png"),
                                        )),
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 4),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        star = rating;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w,
                                        right: 20.w,
                                        bottom: 20.h),
                                    child: Row(
                                      children: [

                                        Expanded(child: custumButton((){
                                          Get.back();
                                        }, "Cancel",decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(16.h),
                                          border: Border.all(color: ConstantData.accentColor),
                                        ),textcolor: ConstantData.accentColor)),
                                       getHorSpace(10.h),
                                        Expanded(
                                          child:custumButton((){
                                            LaunchReview.launch();
                                          }, "Submit",textcolor: ConstantData.bgColor,decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(16.h),

                                            border: Border.all(color: ConstantData.accentColor),
                                            color: ConstantData.accentColor
                                          ))




                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ).paddingSymmetric(vertical: 24.h),
                            );
                          },
                        );



                      }),
                      getVerSpace(24.h),
                      settings_option("feed_back_icon.svg", "Feed back", (){Get.to(FeedBack());}),
                      getVerSpace(24.h),
                      settings_option("about_us_icon.svg", "About us", (){Get.to(AboutUsScreen());}),
                      getVerSpace(24.h),
                      settings_option("theme_icon.svg", "Enable dark mode", (){},widget: GestureDetector(onTap: () async {

                        if (themMode == 1) {
                          PrefData.setThemeMode(0);
                        } else {
                          PrefData.setThemeMode(1);
                        }

                        HomePageScreenController home = Get.find();

                          home.changeTheme();



                        isDarkTheme.value = await PrefData.getThemeMode();

                        setState(() {
                          getThemeMode();
                        });







                      },child: getSvgImage(ConstantData.themeIcon))),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
        onWillPop: () async {
          Get.back();
          return true;
        },
      ),
    );
  }

  settings_option(icon,text,function,{widget}){
    return  GestureDetector(
        onTap: (){
          function();
        },
        child: Container(
          height: 64.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              boxShadow: [
                BoxShadow(offset: Offset(0, 4),
                    blurRadius: 22,
                    color: ConstantData.shadowColor.withOpacity(0.20))

              ],
              color: ConstantData.ContainerbgColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h),
                        color: ConstantData.lightPurpleColor
                    ),
                    child: getSvgImage(icon,height: 24.h,width: 24.h).paddingAll(12.h),
                  ),
                  getHorSpace(16.h),
                  getCustomFont(text, 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400)
                ],
              ),
              widget??SizedBox()
            ],
          ).paddingSymmetric(horizontal: 8.h),
        )
    ).paddingSymmetric(horizontal: 20.h);
  }
  Future<void> sendMail() async {
    final MailOptions mailOptions = MailOptions(
      body: '',
      subject: S.of(context).appName + ': App Feedback',
      recipients: ['templatevilla007@gmail.com'],
      isHTML: true,
    );

    await FlutterMailer.send(mailOptions);
  }
}
