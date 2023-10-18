import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/WaterIntakeResultPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WaterIntakePage extends StatefulWidget {
  @override
  _WaterIntakePage createState() {
    return _WaterIntakePage();
  }
}

class _WaterIntakePage extends State<WaterIntakePage> implements AdsInterfaces{
  Color themeColor = ConstantData.primaryColor;
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  bool? kg;
  RowItem? rowItem;
  List<DropdownMenuItem<String>> currencyList=[];
  String? selectCurrency="";
  String string = "";


  
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

  


    Future.delayed(Duration.zero, () {
      setState(() {
        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);

        string = S.of(context).ft;

        setDefaultData();
      });
    });
  }

  setDefaultData() async {
    int age = await PrefData.getAge();
    double weight = await PrefData.getWeight();

    kg = await PrefData.getKG();
    ageController.text = age.toString();

    if (kg!) {
      selectCurrency = currencyList[0].value;
      weightController.text = weight.round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }
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




    return ConstantWidget.getMainDefaultWidget(context, getWidget(), rowItem!, _requestPop,"Water intake",adsFile:  adsFile);

  }

  getWidget(){
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
              ConstantWidget.getImage(
                  themeColor, context, "gender.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(
                    context,
                    themeColor,
                    S.of(context).enterAge,
                    cellHeight,
                    ageController),
                flex: 1,
              ),
            ],
          ),
        ),
        Container(
          height: cellHeight,
          margin: EdgeInsets.only(top: allMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstantWidget.getImage(
                  themeColor, context, "weight.png"),
              Expanded(
                child: ConstantWidget.getTextFiled(
                    context,
                    themeColor,
                    S.of(context).enterWeight,
                    cellHeight,
                    weightController,true),
                flex: 1,
              ),
              SizedBox(
                width: width,
              ),
              Container(
                width: ConstantWidget.getWidthPercentSize(
                    context, 30),
                child: ConstantWidget.getDropDown(
                    context, selectCurrency!, currencyList,
                        (value) {
                      setState(() {
                        selectCurrency = value;

                        kg = (selectCurrency ==
                            S.of(context).kilogram);
                      });
                    }),
              )
            ],
          ),
        ),
        ConstantWidget.getButtonWidget(
            context, themeColor, S.of(context).dailyWaterIntakeChart,
            rowItem!.link!, (type) {
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
    double weight=0;
    double age=0;
    bool check = false;
    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    } else {
      check = true;
    }
    //
    if (ConstantData.check(ageController.text)) {
      age = double.parse(ageController.text);
    } else {
      check = true;
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (!kg!) {
        weight /= 2.2;
      }

      double dwi;

      if (age <= 30.0) {
        dwi = weight * 40.0;
      } else if (age > 55.0) {
        dwi = weight * 30.0;
      } else {
        dwi = weight * 35.0;
      }

      PrefData.setAge(age.toInt());


      dwi /= 28.3;
      dwi /= 8.0;

       resultModel = new ResultModel();
      resultModel!.value1 = dwi.toInt().toString();



      showInterstitialAd(adsFile, (){
        passData();
      });
      

     
    }
  }

  void reset() {
    ageController.text = "";
    weightController.text = "";
    setState(() {});
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, WaterIntakeResultPage(resultModel!, rowItem!));
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
