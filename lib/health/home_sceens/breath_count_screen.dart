import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/page/BreathCountResultPage.dart';

import 'package:flutter/material.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';

import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BreathCountScreen extends StatefulWidget {


  final RowItem? rowItem;

  const BreathCountScreen({Key? key,this.rowItem}) : super(key: key);



  @override
  State<BreathCountScreen> createState() => _BreathCountScreenState();
}

class _BreathCountScreenState extends State<BreathCountScreen>  implements AdsInterfaces {

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
    }, "Breath count", "breath_count_icon.svg", ConstantData.breathcountColor, "Choose your birth date",(){Get.back();},
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
              getCustomFont(stringDate, 17.sp, ConstantData.breathcountColor, 1,
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
            textcolor: Colors.black,
            color: ConstantData.breathcountColor,
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
  calculate(){
    if(stringDate.isNotEmpty){
      var now = DateTime.now();

      if(currentDate.isBefore(now)){






        int yearsInBetween = now.year
            - currentDate.year;
        int monthsDiff = now.month
            - currentDate.month;


        final daysBetween = DateTime.now().difference(currentDate).inDays;



        double breaths=daysBetween.toDouble();


        if (yearsInBetween >= 1 && yearsInBetween <= 5) {

          breaths = breaths * 25 * 1440;


        } else if (yearsInBetween > 5) {
          breaths = breaths * 11 * 1440;

        } else {
          if (monthsDiff < 6) {
            breaths = breaths * 45 * 1440;
          } else {
            breaths = breaths * 27 * 1440;
          }

        }


        resultModel = new ResultModel();

        resultModel!.value1 = ConstantData.formatData(breaths);



        showInterstitialAd(adsFile, (){
          passData();
        });


      }


    }
  }
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: themeColor,

              colorScheme:
              ColorScheme.light(primary: themeColor,secondary: themeColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now());





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
        context, resultModel!, BreathCountResultPage(resultModel!, rowItem!));
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
