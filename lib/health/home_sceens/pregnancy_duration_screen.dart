import 'package:doctorapp/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/page/PregnancyResultPage.dart';

import 'package:flutter/material.dart';

import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/PdfPage.dart';

import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PregnancyDurationScreen extends StatefulWidget {


  final RowItem? rowItem;

  const PregnancyDurationScreen({Key? key,this.rowItem}) : super(key: key);

  @override
  State<PregnancyDurationScreen> createState() => _PregnancyDurationScreenState();
}

class _PregnancyDurationScreenState extends State<PregnancyDurationScreen> implements AdsInterfaces{
  Color themeColor = ConstantData.primaryColor;

  DateTime currentDate = DateTime.now();

  RowItem? rowItem;
  String stringDate = "";

  
  ResultModel? resultModel;


  AdsFile? adsFile;

  @override
  void dispose() {

    disposeInterstitialAd(adsFile);
    disposeBannerAd(adsFile);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();



    Future.delayed(Duration.zero,(){
      adsFile = new AdsFile(context);
      adsFile!.createInterstitialAd();
      adsFile!.createAnchoredBanner(context, setState);
    });
  

    setState(() {
      stringDate =ConstantData.getFormattedDate(new DateTime.now());
    });
  }




  @override
  Widget build(BuildContext context) {
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      (){};
    }, "Preganancy Duration", "pregnancy_icon.svg", ConstantData.pregnancydurationColor, "Choose the 1st day of your last menstrual period",(){Get.back();},
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
              getCustomFont(stringDate, 17.sp, ConstantData.pregnancydurationColor, 1,
                  fontWeight: FontWeight.w700),

            ],
          ),
        ),
        getButton(Icons.calendar_today, S.of(context).chooseDate, _selectDate,),

        getVerSpace(24.h),

        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
            color: ConstantData.pregnancydurationColor,
            fontWeight: FontWeight.w700,
            fontsize: 16.sp,
        textcolor: Colors.black)
            ,

        getVerSpace(24.h),
        Row(
          children: [
            Expanded(
                child: custumButton(
                      () {
                    return Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChartPage(rowItem!);
                      },
                    ));
                  },
                  "Chart",
                )),
            getHorSpace(16.h),
            Expanded(
                child: custumButton(
                      () {
                        ConstantData.launchURL(rowItem!.link!);
                  },
                  "More info",
                ))
          ],
        ),
        getVerSpace(24.h),
        custumButton(() {
          print("psd====  pregnancy_food_guide.pdf");
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPage(
                "pregnancy_food_guide.pdf", rowItem!),
          ));

        }, S.of(context).pregnancyFoodGuide,
            color: ConstantData.pregnancydurationColor,
            fontWeight: FontWeight.w700,
            fontsize: 16.sp, textcolor: Colors.black),

      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  calculate(){
    if(stringDate.isNotEmpty){
      resultModel = new ResultModel();


      var thirtyDaysFromNow = currentDate.add(new Duration(days: 282));

      resultModel!.value1 = ConstantData.getDefaultDate(thirtyDaysFromNow);

      resultModel!.value2 = ConstantData.getFormattedDate(thirtyDaysFromNow);


      showInterstitialAd(adsFile, (){
        passData();
      });



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
              ColorScheme.light(primary: themeColor,secondary: themeColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(2005),
        lastDate: DateTime(2050));





    if (pickedDate != null )
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

  void passData() {

    ConstantWidget.sendData(
        context, resultModel!, PregnancyResultPage(resultModel!, rowItem!));

  }

  @override
  void onAdClose() {
    // TODO: implement onAdClose
  }

  @override
  void onAdLoad(InterstitialAd interstitialAds) {
    // interstitialAd=interstitialAds;
    // TODO: implement onAdLoad
  }
}
