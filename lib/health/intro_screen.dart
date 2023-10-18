import 'package:doctorapp/health/height_selection_screen.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/weight_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'gender_selection_screen.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'home_sceens/health_home_page.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Future<bool> _requestPop(BuildContext context) {
    Navigator.of(context).pop();
    return new Future.value(true);
  }
  _getIsFirst() async {
    bool isGender = await PrefData.getGenderScreen();
    bool isHeight = await PrefData.getHeightScreen();

    bool isWeight = await PrefData.getWeightScreen();


    if(isGender){
      Navigator.push(
        context,
        PageTransition(
            type:PageTransitionType.scale,
            child: GenderSelectionScreen(),
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            ctx: context),
      );
    }
    else if(isHeight){
      Navigator.push(
        context,
        PageTransition(
            type:PageTransitionType.scale,
            child: HeightSelectionScreen(),
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            ctx: context),
      );
    }
    else if(isWeight){
      Navigator.push(
        context,
        PageTransition(
            type:PageTransitionType.scale,
            child: WeightSelectionScreen(),
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            ctx: context),
      );
    }
    else{
      Navigator.push(
        context,
        PageTransition(
            type:PageTransitionType.scale,
            child: HealthHomePageScreen(),
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            ctx: context),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      child: Scaffold(
          backgroundColor: ConstantData.bgColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
              getVerSpace(109.h),
              getAssetImage("intro_screen_image_new.png",
                  height: 428.h, width: double.infinity),
              getVerSpace(88.h),
              getCustomFont(
                  S.of(context).healthCalculation, 27.sp, ConstantData.textColor, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(16.h),
              getCustomFont(
                  S.of(context).ametMinimMollitNonDeseruntUllamcoEstSitAliquaDolor,
                  15.sp,
                  ConstantData.textColor,
                  2,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center)
                  .paddingSymmetric(horizontal: 20.h),
            ],
          ),
           Align(
             alignment: Alignment.bottomCenter,
             child:  ConstantWidget.getBottomButton(context, S.of(context).getStarted,
                     () {

                       _getIsFirst();
                 }),
           ).paddingSymmetric(horizontal: 20.h)
          ],
        ),
      ),
      onWillPop: () async {
        _requestPop(context);
        return true;
      },
    );
  }
}
