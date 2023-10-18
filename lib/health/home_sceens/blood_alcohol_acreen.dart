import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../generated/l10n.dart';
import '../model/ResultModel.dart';
import '../model/RowItem.dart';
import '../page/BloodAlcoholResultPage.dart';
import '../page/ChartPage.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import '../utils/PrefData.dart';
import '../utils/SizeConfig.dart';
import '../utils/ads_interface.dart';

class BloodAlcoholScreen extends StatefulWidget {
  final RowItem? rowItem;

  const BloodAlcoholScreen({Key? key, this.rowItem}) : super(key: key);

  @override
  State<BloodAlcoholScreen> createState() => _BloodAlcoholScreenState();
}

class _BloodAlcoholScreenState extends State<BloodAlcoholScreen>
    implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  TextEditingController weightController = new TextEditingController();
  bool? kg;
  TextEditingController drinkController = new TextEditingController();
  TextEditingController volumeDrinkController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  List<DropdownMenuItem<String>> currencyList = [];
  List<DropdownMenuItem<String>> drinkList = [];
  List<DropdownMenuItem<String>> timeList = [];
  String? selectGender = "";
  String? selectCurrency = "";
  String? selectDrink = "";
  String? selectTime = "";
  String? selectType = "";
  bool? onchangeWeightCategorykgtopou;

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

    Future.delayed(Duration.zero, () {
      adsFile = new AdsFile(context);
      adsFile!.createInterstitialAd();
      adsFile!.createAnchoredBanner(context, setState);
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

  setdata() {
    setState(() {
      if (kg!) {
        selectCurrency = currencyList[0].value;
        weightController.text = onchangeWeightCategorykgtopou == null ||
                onchangeWeightCategorykgtopou == false
            ? ConstantData.poundToKg(double.parse(weightController.text))
                .round()
                .toString()
            : weightController.text;
        onchangeWeightCategorykgtopou = true;
        // weightController.text = weight.round().toString();
      } else {
        selectCurrency = currencyList[1].value;
        weightController.text = onchangeWeightCategorykgtopou == null ||
                onchangeWeightCategorykgtopou == true
            ? ConstantData.kgToPound(double.parse(weightController.text))
                .round()
                .toString()
            : weightController.text;
        onchangeWeightCategorykgtopou = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    rowItem = widget.rowItem ?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidgetNew(
        context,
        getWidget(),
        rowItem!,
        () {},
        "Blood Alcohol",
        "Blood Alcohol 2.svg",
        ConstantData.bloodalcoholColor,
        "A measure of fitness level of an individual", () {
      Get.back();
    }, adsFile: adsFile);
    // return get_page_layout((){}, "Blood Alcohol", "blood_alcohol_icon.svg", ConstantData.bloodalcoholColor, "A measure of fitness level of an individual",Column());
  }

  getWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getVerSpace(32.h),
        ConstantWidget.getDropDown(context, selectGender!, genderList, (value) {
          setState(() {
            selectGender = value;
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(drinkController, S.of(context).drinksAlcoholLevel)
            .paddingSymmetric(horizontal: 20.h),
        getCustomFont(
          S.of(context).inputANumberEx5For5,
          14.sp,
          ConstantData.textColor,
          1,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Drink volume ", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectDrink!, drinkList, (value) {
          setState(() {
            selectDrink = value;

            setFactor();
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(volumeDrinkController, S.of(context).volumeDrink)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Time passed ", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectTime!, timeList, (value) {
          setState(() {
            selectTime = value;
            setFactor2();
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(timeController, S.of(context).timePassed)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Weight", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectCurrency!, currencyList,
            (value) {
          setState(() {
            selectCurrency = value;
            kg = (selectCurrency == S.of(context).kilogram);
          });
          setdata();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(weightController, S.of(context).enterWeight)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
                color: ConstantData.bloodalcoholColor,
                fontWeight: FontWeight.w700,
                fontsize: 16.sp,
                textcolor: Colors.black)
            .paddingSymmetric(horizontal: 20.h),
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
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(24.h),
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
        weight = weight! * 2.20462;
        // weight *= 2.20462;
      }

      if (factor == 1) {
      } else if (factor == 2) {
        volDrink = volDrink! * 0.033814;
        // volDrink *= 0.033814;
      } else {
        volDrink = volDrink! * 8.0;
        // volDrink *= 8.0;
      }

      alcoholLevel = alcoholLevel! / 100.0;
      // alcoholLevel /= 100.0;
      volDrink = volDrink! * alcoholLevel;
      // volDrink *= alcoholLevel;

      if (factor1 == 1) {
      } else if (factor1 == 2) {
        time = time! * 0.0166;
        // time *= 0.0166;
      } else {
        time = time! * 24.0;
        // time *= 24.0;
      }

      weight = 5.14 / weight!;
      time = time! * 0.015;
      // time *= 0.015;/

      double bac;
      if (selectGender == S.of(context).male) {
        bac = ((volDrink * weight) * 0.73) - time;
      } else {
        bac = ((volDrink * weight) * 0.66) - time;
      }

      //
      // PrefData.setAge(age.toInt());
      // print("bmi----$weight=====$height");
      //
      // double bmi = (weight / (height * height));
      //

      //
      //
      print("bmi----true");
      //

      resultModel = new ResultModel();
      resultModel!.value1 = ConstantData.formatData(bac);

      showInterstitialAd(adsFile, () {
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
    // interstitialAd=interstitialAds;
    // TODO: implement onAdLoad
  }
}
