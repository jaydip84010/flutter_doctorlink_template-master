import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'BloodAlcoholResultPage.dart';

class BloodAlcoholPage extends StatefulWidget {
  @override
  _BloodAlcoholPage createState() {
    return _BloodAlcoholPage();
  }
}

class _BloodAlcoholPage extends State<BloodAlcoholPage> implements AdsInterfaces{
  Color themeColor = ConstantData.primaryColor;
  TextEditingController weightController = new TextEditingController();
  bool? kg;
  TextEditingController drinkController = new TextEditingController();
  TextEditingController volumeDrinkController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList=[];
  List<DropdownMenuItem<String>> typeList=[];
  List<DropdownMenuItem<String>> currencyList=[];
  List<DropdownMenuItem<String>> drinkList=[];
  List<DropdownMenuItem<String>> timeList=[];
  String? selectGender="";
  String? selectCurrency="";
  String? selectDrink="";
  String? selectTime="";
  String? selectType="";

  String string = "";

  double? factor;
  double? factor1;

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

    Future.delayed(Duration.zero,(){
      adsFile = new AdsFile(context);
      adsFile!.createInterstitialAd();
      adsFile!.createAnchoredBanner(context,  setState);

    });



    Future.delayed(Duration.zero, () {
      setState(() {
        genderList = buildAndGetDropDownMenuItems(
            [S.of(context).male, S.of(context).female]);
        typeList = buildAndGetDropDownMenuItems(
            [S.of(context).foot, S.of(context).centimeter]);

        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);
        drinkList = buildAndGetDropDownMenuItems(
            [S.of(context).ounce, S.of(context).ml, S.of(context).cup]);

        timeList = buildAndGetDropDownMenuItems(
            [S.of(context).hour, S.of(context).minute, S.of(context).day]);
        selectGender = genderList[0].value;
        selectType = typeList[0].value;

        string = S.of(context).ft;

        setDefaultData();
      });
    });
  }

  setDefaultData() async {
    int gender = await PrefData.getGender();
    double weight = await PrefData.getWeight();
    kg = await PrefData.getKG();




    selectGender = genderList[gender].value;

    selectDrink = drinkList[0].value;
    selectTime = timeList[0].value;

    if (kg!) {
      selectCurrency = currencyList[0].value;
      weightController.text = weight.round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }

    setFactor();
    setFactor2();

    setState(() {});
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
        context, getWidget(), rowItem!, _requestPop,"Blood alcohol",adsFile: adsFile);
  }

  getWidget() {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 7);
    double allMargin = ConstantWidget.getScreenPercentSize(context, 1);
    double width = ConstantWidget.getWidthPercentSize(context, 2);
    return ListView(
      children: [
        Container(
          height: cellHeight,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstantWidget.getImage(themeColor, context, "height.png"),
              Expanded(
                child: ConstantWidget.getDropDown(
                    context, selectGender!, genderList, (value) {
                  setState(() {
                    selectGender = value;
                  });
                }),
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
              ConstantWidget.getImage(themeColor, context, "coconut.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(
                    context,
                    themeColor,
                    S.of(context).drinksAlcoholLevel,
                    cellHeight,
                    drinkController),
                flex: 1,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: ConstantWidget.getWidthPercentSize(context, 7) +
                  ConstantWidget.getWidthPercentSize(context, 4)),
          child: ConstantWidget.getDefaultTextWidget(
              S.of(context).inputANumberEx5For5,
              TextAlign.start,
              FontWeight.w300,
              ConstantWidget.getPercentSize(cellHeight, 18),
              ConstantData.textColor),
        ),
        Container(
          height: cellHeight,
          margin: EdgeInsets.only(top: allMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstantWidget.getImage(themeColor, context, "cheers.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(
                    context,
                    themeColor,
                    S.of(context).volumeDrink,
                    cellHeight,
                    volumeDrinkController),
                flex: 1,
              ),
              SizedBox(
                width: width,
              ),
              Container(
                width: ConstantWidget.getWidthPercentSize(context, 30),
                child: ConstantWidget.getDropDown(
                    context, selectDrink!, drinkList, (value) {
                  setState(() {
                    selectDrink = value;

                    setFactor();
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
              ConstantWidget.getImage(themeColor, context, "cheers.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(context, themeColor,
                    S.of(context).timePassed, cellHeight, timeController),
                flex: 1,
              ),
              SizedBox(
                width: width,
              ),
              Container(
                width: ConstantWidget.getWidthPercentSize(context, 30),
                child: ConstantWidget.getDropDown(context, selectTime!, timeList,
                    (value) {
                  setState(() {
                    selectTime = value;
                    setFactor2();
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
              ConstantWidget.getImage(themeColor, context, "weight.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(context, themeColor,
                    S.of(context).enterWeight, cellHeight, weightController,true),
                flex: 1,
              ),
              SizedBox(
                width: width,
              ),
              Container(
                width: ConstantWidget.getWidthPercentSize(context, 30),
                child: ConstantWidget.getDropDown(
                    context, selectCurrency!, currencyList, (value) {
                  setState(() {
                    selectCurrency = value;

                    kg = (selectCurrency == S.of(context).kilogram);
                  });
                }),
              )
            ],
          ),
        ),
        ConstantWidget.getButtonWidget(
            context, themeColor, S.of(context).bloodAlcoholChart, rowItem!.link!, (type) {
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

  setFactor() {
    if (selectDrink == S.of(context).ounce) {
      factor = 1;
    } else if (selectDrink == S.of(context).ml) {
      factor = 2;
    } else {
      factor = 3;
    }
  }

  setFactor2() {
    if (selectTime == S.of(context).hour) {
      factor1 = 1;
    } else if (selectTime == S.of(context).minute) {
      factor1 = 2;
    } else {
      factor1 = 3;
    }
  }

  calculate() {
    double? weight;
    double? alcoholLevel;
    double? volDrink;
    double? time;
    bool check = false;

    if (ConstantData.check(drinkController.text)) {
      alcoholLevel = double.parse(drinkController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(volumeDrinkController.text)) {
      volDrink = double.parse(volumeDrinkController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(timeController.text)) {
      time = double.parse(timeController.text);
    } else {
      check = true;
    }


    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (kg!) {
        weight=weight!*2.20462;
      }

      if (factor == 1) {
      } else if (factor == 2) {
        volDrink =volDrink!* 0.033814;
      } else {
        volDrink =volDrink!* 8.0;
      }

      alcoholLevel =alcoholLevel!/100.0;
      volDrink = volDrink!*alcoholLevel;

      if (factor1 == 1) {
      } else if (factor1 == 2) {
        time = time!*0.0166;
      } else {
        time = time!*24.0;
      }

      weight = 5.14 / weight!;
      time = time!*0.015;

      double bac;
      if (selectGender == S.of(context).male) {
        bac = ((volDrink * weight) * 0.73) - time;
      } else {
        bac = ((volDrink * weight) * 0.66) - time;
      }

      print("bmi----true");


      resultModel = new ResultModel();
      resultModel!.value1 = ConstantData.formatData(bac);


      showInterstitialAd(adsFile, (){
        passData();
      });
    }
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, BloodAlcoholResultPage(resultModel!, rowItem!));
  }


  void reset() {
    drinkController.text = "";
    timeController.text = "";
    volumeDrinkController.text = "";
    weightController.text = "";
    setState(() {});
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
