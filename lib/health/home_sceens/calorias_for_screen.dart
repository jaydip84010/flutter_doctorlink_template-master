import 'package:doctorapp/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/CaloriesWeightResultPage.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/PdfPage.dart';

import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CaloriasForScreen extends StatefulWidget {

  final RowItem? rowItem;

  const CaloriasForScreen({Key? key,this.rowItem}) : super(key: key);




  @override
  State<CaloriasForScreen> createState() => _CaloriasForScreenState();
}

class _CaloriasForScreenState extends State<CaloriasForScreen>
    implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController targetWeightController = new TextEditingController();
  bool? centimeter;
  bool? kg;
  bool? wkg;
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  List<DropdownMenuItem<String>> sedentaryList = [];
  List<DropdownMenuItem<String>> weightList = [];
  List<DropdownMenuItem<String>> weekList = [];
  List<DropdownMenuItem<String>> currencyList = [];
  String? selectGender = "";
  String? selectCurrency = "";
  String? selectTargetWeight = "";
  String? selectSedentary = "";
  double factor = 0;
  String? selectWeight = "";
  String? selectWeek = "";
  String? selectType = "";
  String string = "";
  bool? onchangeWeightCategorykgtopou;
  bool? onchangeTargetWeightCategorykgtopou;

  
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

        sedentaryList = buildAndGetDropDownMenuItems([
          S.of(context).sedentary,
          S.of(context).little,
          S.of(context).moderate,
          S.of(context).hard,
          S.of(context).veryHard
        ]);
        weightList = buildAndGetDropDownMenuItems(
            [S.of(context).gainWeight, S.of(context).lossWeight]);
        weekList = buildAndGetDropDownMenuItems(
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]);

        selectGender = genderList[0].value;
        selectType = typeList[0].value;

        string = S.of(context).ft;

        setDefaultData();
      });
    });
  }

  setDefaultData() async {
    int age = await PrefData.getAge();
    int gender = await PrefData.getGender();
    double height = await PrefData.getHeight();
    double weight = await PrefData.getWeight();
    double Targetweight = await PrefData.getTargetWeight();
    centimeter = await PrefData.getCM();
    kg = await PrefData.getKG();
    wkg = await PrefData.getKG();
    ageController.text = age.toString();

    selectGender = genderList[gender].value;

    if (centimeter!) {
      selectType = typeList[1].value;
      string = S.of(context).cm;
      ftController.text = ConstantData.meterToCm(height).round().toString();
    } else {
      print("age---${ageController.text.toString()}");

      selectType = typeList[0].value;
      string = S.of(context).ft;
      setState(() {
        ConstantData.meterToInchAndFeet(height, ftController, inchController);
      });
    }

    if (kg!) {
      selectTargetWeight = currencyList[0].value;
      selectCurrency = currencyList[0].value;
      weightController.text = weight.round().toString();
      targetWeightController.text = Targetweight.round().toString();
    } else {
      selectTargetWeight = currencyList[1].value;
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
      targetWeightController.text =
          ConstantData.kgToPound(Targetweight).round().toString();
    }
    if (wkg!) {
      selectTargetWeight = currencyList[0].value;
      targetWeightController.text = Targetweight.round().toString();
    } else {
      selectTargetWeight = currencyList[1].value;
      targetWeightController.text =
          ConstantData.kgToPound(Targetweight).round().toString();
    }

    print("weight---${weightController.text}---$kg");
    selectSedentary = sedentaryList[0].value;
    selectWeek = weekList[0].value;
    selectWeight = weightList[0].value;

    setFactor();
    checkData(centimeter!);
    setState(() {});
  }

  void checkData(bool val) {
    if (centimeter != val) {
      if (centimeter!) {
        if (ConstantData.check(ftController.text) &&
            ConstantData.check(inchController.text)) {
          int i1 = 0;

          try {
            i1 = int.parse(ftController.text);
          } on Exception catch (_) {
            print('never reached');
          }

          int i2 = 0;

          try {
            i2 = int.parse(inchController.text);
          } on Exception catch (_) {
            print('never reached');
          }

          String s =
              ConstantData.meterToCm(ConstantData.feetAndInchToMeter(i1, i2))
                  .round()
                  .toString();

          setState(() {
            ftController.text = s;
          });
        }
      } else {
        if (ConstantData.check(ftController.text)) {
          setState(() {
            ConstantData.meterToInchAndFeet(
                ConstantData.cmToMeter(double.parse(ftController.text)),
                ftController,
                inchController);
          });
        }
      }
    }
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
      } else {
        selectCurrency = currencyList[1].value;
        weightController.text =
        onchangeWeightCategorykgtopou == null ||
            onchangeWeightCategorykgtopou == true?ConstantData.kgToPound(double.parse(weightController.text))
            .round()
            .toString():weightController.text;
        onchangeWeightCategorykgtopou = false;
      }
    });
  }
  setTargretWeightdata() {
    setState(() {
      if (wkg!) {
        selectTargetWeight = currencyList[0].value;
        targetWeightController.text = onchangeTargetWeightCategorykgtopou == null ||
            onchangeTargetWeightCategorykgtopou == false
            ? ConstantData.poundToKg(double.parse(targetWeightController.text))
            .round()
            .toString()
            : targetWeightController.text;
        onchangeTargetWeightCategorykgtopou = true;
      } else {
        selectTargetWeight = currencyList[1].value;
        targetWeightController.text =
        onchangeTargetWeightCategorykgtopou == null ||
            onchangeTargetWeightCategorykgtopou == true?ConstantData.kgToPound(double.parse(targetWeightController.text))
            .round()
            .toString():targetWeightController.text;
        onchangeTargetWeightCategorykgtopou = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      reset();
    },
        "Calorias For Calcuration",
        "calories_icon.svg",
        ConstantData.caloriasColor,
        "A measure of fitness level of an individual",(){Get.back();},
        adsFile: adsFile);
  }

  getWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getVerSpace(32.h),
        getCustomFont("Age", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        Row(
          children: [
            Expanded(
              child: getTextField(
                ageController,
                S.of(context).enterAge,
              ),
            ),
            getHorSpace(20.h),
            Expanded(
              child: ConstantWidget.getDropDown(
                  context, selectGender!, genderList, (value) {
                setState(() {
                  selectGender = value;
                });
              }),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Height", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectType!, typeList, (value) {
          bool oldVal = centimeter!;

          setState(() {
            selectType = value;

            centimeter = (selectType == S.of(context).centimeter);

            checkData(oldVal);

            if (selectType == S.of(context).centimeter) {
              string = S.of(context).cm;
            } else {
              string = S.of(context).ft;
            }
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        Container(
          height: 54.h,
          child: getTextField(ftController, S.of(context).enterHeight,
              textInputAction: (selectType == S.of(context).centimeter)
                  ? (selectType == S.of(context).centimeter)
                      ? TextInputAction.done
                      : TextInputAction.next
                  : TextInputAction.next,
              suffixWidget: Container(
                  height: 54.h,
                  width: 54.h,
                  child: Center(
                      child: getCustomFont(
                          string , 15.sp, ConstantData.grayColor, 1,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center)))),
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        Visibility(
          child: Container(
              height: 54.h,
              child: getTextField(
                inchController,
                S.of(context).enterHeight,
                textInputAction: (selectType == S.of(context).foot)
                    ? (selectType == S.of(context).foot)
                        ? TextInputAction.done
                        : TextInputAction.next
                    : TextInputAction.next,
                suffixWidget: Container(
                    height: 54.h,
                    width: 54.h,
                    child: Center(
                        child: getCustomFont(S.of(context).inch, 15.sp,
                            ConstantData.grayColor, 1,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center))),
              )),
          visible: (selectType == S.of(context).foot),
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Weight", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),

        ConstantWidget.getDropDown(context, selectCurrency ?? "", currencyList,
            (value) {
          setState(() {
            selectCurrency = value;
            kg = (selectCurrency == S.of(context).kilogram);
          });
          setdata();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(
          weightController,
          S.of(context).enterWeight,
          suffixWidget: Container(
              height: 54.h,
              width: 75.h,
              child: Center(
                  child: getCustomFont("(${kg! ? 'kg' : 'pound'})", 15.sp,
                      ConstantData.grayColor, 1,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center))),
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Select Type", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectSedentary!, sedentaryList,
            (value) {
          setState(() {
            selectSedentary = value;
            setFactor();
          });

        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Target Weight", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectTargetWeight!, currencyList,
            (value) {
          setState(() {
            selectTargetWeight = value;
            wkg = (currencyList == S.of(context).kilogram);
          });
          setTargretWeightdata();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),



        getTextField(
          targetWeightController,
          S.of(context).targetWeight,
          suffixWidget: Container(
              height: 54.h,
              width: 54.h,
              child: Center(
                  child: getCustomFont(
                      "(${(selectTargetWeight == 'Pounds' ? "Pound" : "Kg")})",
                      15.sp,
                      ConstantData.grayColor,
                      1,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center))),
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Weight Type", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),

        ConstantWidget.getDropDown(context, selectWeight!, weightList, (value) {
          setState(() {
            selectWeight = value;
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Select Number of Week", 17.sp, ConstantData.textColor, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(context, selectWeek!, weekList, (value) {
          setState(() {
            selectWeek = value;
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),



        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
                color: ConstantData.caloriasColor,
                fontWeight: FontWeight.w700,
                fontsize: 16.sp,textcolor: Colors.black)
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
        custumButton(() {
          Get.to(
            PdfPage("food_calorie.pdf", rowItem!),
          );
        }, "Food Calories List",
                color: ConstantData.caloriasColor,
                fontWeight: FontWeight.w700,
                fontsize: 16.sp,
        textcolor: Colors.black)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(24.h),

      ],
    );
  }

  setFactor() {
    if (selectSedentary == S.of(context).sedentary) {
      factor = 1.2;
    } else if (selectSedentary == S.of(context).little) {
      factor = 1.375;
    } else if (selectSedentary == S.of(context).moderate) {
      factor = 1.55;
    } else if (selectSedentary == S.of(context).hard) {
      factor = 1.725;
    } else {
      factor = 1.9;
    }
  }

  calculate() {
    double? height = 0;
    double? height2 = 0;
    double? weight = 0;
    double? age = 0;
    bool check = false;

    if (ConstantData.check(ftController.text)) {
      height = double.parse(ftController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(ageController.text)) {
      age = double.parse(ageController.text);
    } else {
      check = true;
    }

    if (!centimeter!) {
      if (ConstantData.check(inchController.text)) {
        height2 = double.parse(inchController.text);
      } else {
        check = true;
      }
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (!centimeter!) {
        height = height * 12.0;
        height = height + height2;
        height *= 2.54;
      }

      if (!kg!) {
        weight *= 0.453592;
      }

      if (selectGender == S.of(context).male) {
        weight *= 13.7;
        weight += 66.0;
        height *= 5.0;
        age *= 6.8;
      } else {
        weight *= 9.6;
        weight += 655.0;
        height *= 1.8;
        age *= 4.7;
      }

      PrefData.setAge(age.toInt());

      int getWeight = 0;

      if (ConstantData.check(weightController.text)) {
        getWeight = int.parse(weightController.text);

        if (!kg!) {
          getWeight = ConstantData.poundToKg(getWeight.roundToDouble()).round();
        }
      }

      String stringBmr;
      double bmr = (weight + height) - age;
      bmr *= factor;

      stringBmr = ConstantData.formatData(bmr);

      resultModel = new ResultModel();
      resultModel!.value1 = stringBmr;

      if (ConstantData.check(targetWeightController.text)) {
        int targetWeight = int.parse(targetWeightController.text);

        if (selectTargetWeight != S.of(context).kilogram) {
          int week = int.parse(selectWeek!);

          double calRequired = 0;

          targetWeight =
              ConstantData.poundToKg(targetWeight.toDouble()).round();

          if (selectWeight == S.of(context).gainWeight) {
            double calRequired1 = (targetWeight - getWeight) * (1100 / week);
            calRequired = calRequired1 + bmr;
          } else {
            double calRequired2 = (getWeight - targetWeight) * (1100 / week);
            calRequired = bmr - calRequired2;
          }
          resultModel!.value2 = ConstantData.formatData(calRequired).toString();
        } else {
          int week = int.parse(selectWeek!);

          double calRequired = 0;

          if (selectWeight == S.of(context).gainWeight) {
            double calRequired1 = (targetWeight - getWeight) * (1100 / week);
            calRequired = calRequired1 + bmr;
          } else {
            double calRequired2 = (getWeight - targetWeight) * (1100 / week);
            calRequired = bmr - calRequired2;
          }
          resultModel!.value2 = ConstantData.formatData(calRequired).toString();
        }

        showInterstitialAd(adsFile, () {
          passData();
        });

      }
    }
  }

  void reset() {
    setState(() {
      ageController.text = "";
      ftController.text = "";
      inchController.text = "";
      weightController.text = "";
      targetWeightController.text = "";
    });
  }

  void passData() {
    ConstantWidget.sendData(context, resultModel!,
        CaloriesWeightResultPage(resultModel!, rowItem!));
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
