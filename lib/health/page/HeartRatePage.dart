import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'HeartRateResultPage.dart';

class HeartRatePage extends StatefulWidget {
  @override
  _HeartRatePage createState() {
    return _HeartRatePage();
  }
}

class _HeartRatePage extends State<HeartRatePage> implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  TextEditingController ageController = new TextEditingController();
  TextEditingController heartRateController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  String? selectGender = "";
  double? factor1;
  double? factor2;
  String? selectType = "";

  ResultModel? resultModel;

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

    Future.delayed(Duration.zero, () {
      setState(() {
        genderList = buildAndGetDropDownMenuItems(
            [S.of(context).male, S.of(context).female]);
        typeList = buildAndGetDropDownMenuItems([
          S.of(context).little,
          S.of(context).moderate,
          S.of(context).hard,
          S.of(context).veryHard
        ]);

        selectGender = genderList[0].value;
        selectType = typeList[0].value;

        setDefaultData();
      });
    });
  }

  setDefaultData() async {
    int age = await PrefData.getAge();
    int gender = await PrefData.getGender();

    ageController.text = age.toString();

    selectGender = genderList[gender].value;
    setFactor();
    setState(() {});
  }

  setFactor() {
    if (selectType == S.of(context).little) {
      factor1 = 0.6;
      factor2 = 0.65;
    } else if (selectType == S.of(context).moderate) {
      factor1 = 0.65;
      factor2 = 0.7;
    } else if (selectType == S.of(context).hard) {
      factor1 = 0.7;
      factor2 = 0.75;
    } else {
      factor1 = 0.75;
      factor2 = 0.8;
    }
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = [];
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
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
        context, getWidget(), rowItem!, _requestPop, "Target heart",
        adsFile: adsFile);
  }

  getWidget() {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 7);
    double allMargin = ConstantWidget.getScreenPercentSize(context, 1);
    double width = ConstantWidget.getWidthPercentSize(context, 2);
    return ListView(
      children: [
        Container(
          height: cellHeight,
          margin: EdgeInsets.only(top: allMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstantWidget.getImage(themeColor, context, "gender.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(context, themeColor,
                    S.of(context).enterAge, cellHeight, ageController),
                flex: 1,
              ),
              SizedBox(
                width: width,
              ),
              Container(
                width: ConstantWidget.getWidthPercentSize(context, 30),
                child: ConstantWidget.getDropDown(
                    context, selectGender!, genderList, (value) {
                  setState(() {
                    selectGender = value;
                  });
                }),
              )
            ],
          ),
        ),
        Container(
          height: cellHeight,
          margin: EdgeInsets.only(top: allMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstantWidget.getImage(themeColor, context, "heart-rate.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(
                    context,
                    themeColor,
                    S.of(context).enterRestingHeartRate,
                    cellHeight,
                    heartRateController,
                    true),
                flex: 1,
              ),
            ],
          ),
        ),
        Container(
          height: cellHeight,
          margin: EdgeInsets.only(top: allMargin),
          child: Row(
            children: [
              ConstantWidget.getImage(themeColor, context, "height.png"),
              Expanded(
                child: ConstantWidget.getDropDown(
                    context, selectType!, typeList, (value) {
                  setState(() {
                    selectType = value;
                    setFactor();
                  });
                }),
                flex: 1,
              ),
              Expanded(
                child: Container(),
                flex: 1,
              )
            ],
          ),
        ),
        ConstantWidget.getButtonWidget(context, themeColor,
            S.of(context).targetHeartRateChart, rowItem!.link!, (type) {
          if (type == ConstantData.calculate) {
            calculate();
          } else if (type == ConstantData.reset) {
            reset();
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChartPage(rowItem!),
                ));
          }
        })
      ],
    );
  }

  calculate() {
    double rhr = 0;
    double mhr = 0;
    double age = 0;
    bool check = false;

    if (ConstantData.check(heartRateController.text)) {
      rhr = double.parse(heartRateController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(ageController.text)) {
      age = double.parse(ageController.text);
    } else {
      check = true;
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (selectGender == S.of(context).male) {
        age *= 0.8;
        mhr = 214.0 - age;
      } else {
        age *= 0.9;
        mhr = 209.0 - age;
      }

      PrefData.setAge(age.toInt());
      resultModel = new ResultModel();
      resultModel!.value1 = ConstantData.formatData(mhr);

      mhr -= rhr;

      double min = (mhr * factor1!) + rhr;
      double max = (mhr * factor2!) + rhr;

      resultModel!.value2 = ConstantData.formatData(min);
      resultModel!.value3 = ConstantData.formatData(max);

      showInterstitialAd(adsFile, () {
        passData();
      });
    }
  }

  void reset() {
    ageController.text = "";
    heartRateController.text = "";
    setState(() {});
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, HeartRateResultPage(resultModel!, rowItem!));
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
