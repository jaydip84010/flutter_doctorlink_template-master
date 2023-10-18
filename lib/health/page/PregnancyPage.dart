import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/page/PregnancyResultPage.dart';

import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/PdfPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class PregnancyPage extends StatefulWidget {

  @override
  _PregnancyPage createState() {
    return _PregnancyPage();
  }
}

class _PregnancyPage extends State<PregnancyPage> implements AdsInterfaces{
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

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);




    return ConstantWidget.getMainDefaultWidget(context, getWidget(), rowItem!, _requestPop,"Pregnancy duration",adsFile:  adsFile);

  }


  getWidget(){
    double sliderHeight = SizeConfig.safeBlockVertical !* 18;
    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);

    return  ListView(
      children: [
        SizedBox(
          height: (margin),
        ),
        ConstantWidget.getDefaultTextWidget(
            S
                .of(context)
                .chooseThe1stDayOfYourLastMenstrualPeriod,
            TextAlign.center,
            FontWeight.w500,
            ConstantWidget.getWidthPercentSize(context, 5),
            ConstantData.textColor),
        SizedBox(
          height: (margin),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstantWidget.getDefaultTextWidget(
                S.of(context).dateChosen,
                TextAlign.center,
                FontWeight.w500,
                ConstantWidget.getWidthPercentSize(
                    context, 3.5),
                ConstantData.textColor),
            SizedBox(
              width: (margin * 2),
            ),
            ConstantWidget.getDefaultTextWidget(
                stringDate,
                TextAlign.center,
                FontWeight.w500,
                ConstantWidget.getWidthPercentSize(
                    context, 3.5),
                themeColor),
          ],
        ),
        SizedBox(
          height: (margin),
        ),

        Wrap(
          children: [

            getButton(Icons.calendar_today, S.of(context).chooseDate, _selectDate),
            getButton(null, S.of(context).calculate,calculate)

          ],
        ),
        ConstantWidget.getButton(context,
            S.of(context).pregnancyWeightGainChart, themeColor, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChartPage(
                        rowItem!),
                  ));
            }),

        ConstantWidget.getButton(context,
            S.of(context).pregnancyFoodGuide, themeColor, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPage(
                        "pregnancy_food_guide.pdf", rowItem!),
                  ));
            })

        ,

        ConstantWidget.getMoreInformationButton(context,
            rowItem!.link!, themeColor)
      ],
    );
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

    double subRadius = ConstantWidget.getWidthPercentSize(context, 1.5);
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
                  Radius.circular(subRadius))),
          child: Stack(
            children: [
              Visibility(child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),visible: (icon!=null),),
              Center(
                child: ConstantWidget
                    .getDefaultTextWidget(
                    s,
                    TextAlign.center,
                    FontWeight.w500,
                    fontSize,
                    Colors.white),
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
    // TODO: implement onAdLoad
  }
}
