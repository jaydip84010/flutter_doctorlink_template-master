import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/CanDonatePage.dart';
import 'package:doctorapp/health/page/EligiblePage.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'BloodDonationResultPage.dart';

class BloodDonationPage extends StatefulWidget {
  @override
  _BloodDonationPage createState() {
    return _BloodDonationPage();
  }
}

class _BloodDonationPage extends State<BloodDonationPage>
    implements AdsInterfaces {
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

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidget(
        context, getWidget(), rowItem!, _requestPop,"Blood donation",adsFile: adsFile);
  }

  getWidget() {
    double sliderHeight = SizeConfig.safeBlockVertical! * 18;
    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);
    return ListView(
      children: [
        SizedBox(
          height: (margin),
        ),
        ConstantWidget.getDefaultTextWidget(
            S.of(context).chooseTheDateOfLastDonation,
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
                ConstantWidget.getWidthPercentSize(context, 3.5),
                ConstantData.textColor),
            SizedBox(
              width: (margin * 2),
            ),
            ConstantWidget.getDefaultTextWidget(
                stringDate,
                TextAlign.center,
                FontWeight.w500,
                ConstantWidget.getWidthPercentSize(context, 3.5),
                themeColor),
          ],
        ),
        SizedBox(
          height: (margin),
        ),
        Material(
          color: Colors.transparent,
          child: getButton(Icons.calendar_today, S.of(context).chooseDate,
              _selectDate, false),
        ),
        Material(
            color: Colors.transparent,
            child: getButton(null, S.of(context).calculate, calculate, true)),
        ConstantWidget.getButton(context, S.of(context).canIDonate, themeColor,
            () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CanDonatePage(rowItem!),
              ));
        }),
        ConstantWidget.getButton(
            context, S.of(context).eligibilityToDonate, themeColor, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EligiblePage(rowItem!),
              ));
        }),
        ConstantWidget.getMoreInformationButton(
            context, rowItem!.link!, themeColor)
      ],
    );
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


              colorScheme:
                  ColorScheme.light(primary: themeColor, secondary: themeColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialDate: currentDate,

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

  getButton(var icon, String s, Function function, bool isAds) {
    double buttonHeight = ConstantWidget.getScreenPercentSize(context, 6);
    double buttonWidth = ConstantWidget.getScreenPercentSize(context, 25);

    double subRadius = ConstantWidget.getWidthPercentSize(context, 1.5);
    double fontSize = ConstantWidget.getPercentSize(buttonHeight, 32);
    double iconSize = ConstantWidget.getPercentSize(buttonHeight, 50);
    double sliderHeight = SizeConfig.safeBlockVertical! * 18;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);

    return Center(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(top: margin),
          width: buttonWidth,
          padding:
              EdgeInsets.all(ConstantWidget.getPercentSize(buttonWidth, 1.5)),
          height: buttonHeight,
          decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.all(Radius.circular(subRadius))),
          child: Stack(
            children: [
              Visibility(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
                visible: (icon != null),
              ),
              Center(
                child: ConstantWidget.getDefaultTextWidget(s, TextAlign.center,
                    FontWeight.w500, fontSize, Colors.white),
              )
            ],
          ),
        ),
        onTap: () {
          if (isAds) {
            showInterstitialAd(adsFile!, () {
              function();
            });
          } else {
            function();
          }
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
