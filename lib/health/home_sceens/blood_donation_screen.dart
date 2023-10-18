import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/CanDonatePage.dart';
import 'package:doctorapp/health/page/EligiblePage.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/ResultModel.dart';
import '../page/BloodDonationResultPage.dart';

import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/ads_interface.dart';


class BloodDonationScreen extends StatefulWidget {


  final RowItem? rowItem;

  const BloodDonationScreen({Key? key,this.rowItem}) : super(key: key);






  @override
  State<BloodDonationScreen> createState() => _BloodDonationScreenState();
}

class _BloodDonationScreenState extends State<BloodDonationScreen>   implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;

  DateTime currentDate = DateTime.now();

  RowItem? rowItem;
  String stringDate = "hj";

  

  @override
  void dispose() {
    disposeInterstitialAd(adsFile);
    disposeBannerAd(adsFile);
    super.dispose();
  }

  AdsFile? adsFile;

  @override
  void initState() {
    super.initState();
  
    Future.delayed(Duration.zero, () {
      adsFile = new AdsFile(context);
      adsFile!.createInterstitialAd();
      adsFile!.createAnchoredBanner(context, setState);
    });

    
    setState(() {
      stringDate = ConstantData.getFormattedDate(new DateTime.now());
    });
  }



  @override
  Widget build(BuildContext context) {
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
    }, "Blood Donation",
        "Blood donation.svg",
        ConstantData.blooddonationColor,
        "A measure of fitness level of an individual",(){Get.back();},
        adsFile: adsFile);


  }

  getWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getVerSpace(24.h),
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              getCustomFont( S.of(context).dateChosen, 17.sp, ConstantData.textColor, 1,
                  fontWeight: FontWeight.w700),
              getHorSpace(16.h),
              getCustomFont(stringDate, 17.sp, ConstantData.blooddonationColor, 1,
                  fontWeight: FontWeight.w700),

            ],
          ),
        ),
        getButton(Icons.calendar_today, S.of(context).chooseDate, _selectDate),

        getVerSpace(24.h),

        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
            color: ConstantData.blooddonationColor,
            fontWeight: FontWeight.w700,
            fontsize: 16.sp,
        textcolor: Colors.black),
        getVerSpace(24.h),
        custumButton(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CanDonatePage(rowItem!),
              ));
        }, "Can i donate",textcolor: Colors.black,
            color: ConstantData.blooddonationColor,
            fontWeight: FontWeight.w700,
            fontsize: 16.sp),getVerSpace(24.h),
        custumButton(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EligiblePage(rowItem!),
              ));
        }, textcolor: Colors.black,"Eligibility to donate",
            color: ConstantData.blooddonationColor,
            fontWeight: FontWeight.w700,
            fontsize: 16.sp),


        getVerSpace(24.h),


        Row(
          children: [

            Expanded(
                child: custumButton(
                      () {
                    ConstantData.launchURL(rowItem!.link!);
                  },
                  "More info",
                ))
          ],
        ),

      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  calculate() {
    if (stringDate.isNotEmpty) {
      ResultModel resultModel = new ResultModel();


      var thirtyDaysFromNow = currentDate.add(new Duration(days: 56));

      resultModel.value1 = ConstantData.getDefaultDate(thirtyDaysFromNow);
      resultModel.value2 = ConstantData.getFormattedDate(thirtyDaysFromNow);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BloodDonationResultPage(resultModel, rowItem!),
          ));
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: themeColor,
              // accentColor: themeColor,

              colorScheme:
              ColorScheme.light(primary: themeColor, secondary: themeColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialDate: currentDate,
        // initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(2050));

    if (pickedDate != null)
      setState(() {
        currentDate = pickedDate;

        setState(() {
          stringDate = ConstantData.getFormattedDate(currentDate);
        });
      });
  }

  getButton(var icon,String s,Function function){

    double buttonHeight = ConstantWidget.getScreenPercentSize(context, 6);
    double buttonWidth = ConstantWidget.getScreenPercentSize(context, 25);

    double fontSize = ConstantWidget.getPercentSize(buttonHeight, 32);
    double iconSize = ConstantWidget.getPercentSize(buttonHeight, 50);
    double sliderHeight = SizeConfig.safeBlockVertical !* 18;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);



    return     Center(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(top: margin),

          width: buttonWidth,
          padding: EdgeInsets.all(
              ConstantWidget.getPercentSize(
                  buttonWidth, 1.5)),
          height: buttonHeight,
          decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(16.h))),
          child: Stack(
            children: [
              Visibility(child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                  size: iconSize,
                ),
              ).paddingOnly(left: 16.h),visible: (icon!=null),),
              Center(
                child: ConstantWidget
                    .getDefaultTextWidget(
                    s,
                    TextAlign.center,
                    FontWeight.w500,
                    fontSize,
                    ConstantData.blackColor),
              )
            ],
          ),
        ),
        onTap: (){
          function();
        },
      ),
    );
  }

  @override
  void onAdClose() {
    // TODO: implement onAdClose
  }

  @override
  void onAdLoad(InterstitialAd interstitialAds) {

    // TODO: implement onAdLoad
  }

}
