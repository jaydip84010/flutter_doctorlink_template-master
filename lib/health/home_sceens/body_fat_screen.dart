
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../model/ResultModel.dart';
import '../page/BodyFatResultPage.dart';
import '../page/ChartPage.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import '../utils/PrefData.dart';
import '../utils/SizeConfig.dart';

class BOdyFatScreen extends StatefulWidget {


  final RowItem? rowItem;
  BOdyFatScreen
      ({this.rowItem});


  @override
  State<BOdyFatScreen> createState() => _BOdyFatScreenState();
}

class _BOdyFatScreenState extends State<BOdyFatScreen> implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController waistController = new TextEditingController();
  TextEditingController forArmController = new TextEditingController();
  TextEditingController wristController = new TextEditingController();
  TextEditingController hipController = new TextEditingController();
  TextEditingController neckController = new TextEditingController();
  bool? centimeter;
  bool? kg;
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList=[];
  List<DropdownMenuItem<String>> typeList=[];
  List<DropdownMenuItem<String>> currencyList=[];
  List<DropdownMenuItem<String>> cnList=[];
  List<DropdownMenuItem<String>> femaleList=[];
  List<DropdownMenuItem<String>> neckList=[];
  String? selectGender="";
  String? selectWaist="";
  String? selectArm="";
  String? selectWrist="";
  String? selectHip="";
  String? selectNeck="";
  String? selectCurrency="";
  String? selectType="";
  String? string = "";
  AdsFile? adsFile;
  bool? onchangeWeightCategorykgtopou;
  bool? onchangeWaistCategorycmtoin;
  bool? onchangeNeckCategorycmtoin;


  
  ResultModel? resultModel;

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
        genderList = buildAndGetDropDownMenuItems(
            [S.of(context).male, S.of(context).female]);
        typeList = buildAndGetDropDownMenuItems(
            [S.of(context).foot, S.of(context).centimeter]);

        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);

        cnList = buildAndGetDropDownMenuItems(
            [S.of(context).centimeter, S.of(context).inches]);
        femaleList = buildAndGetDropDownMenuItems(
            [S.of(context).centimeter, S.of(context).foot]);

        selectGender = genderList[0].value;
        selectType = typeList[0].value;

        string = S.of(context).ft;

        setDefaultData();
      });
    });
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
  setdataWaistData() {
    setState(() {
      if (centimeter!) {
        selectWaist = cnList[0].value;
        waistController.text = onchangeWaistCategorycmtoin == null ||
            onchangeWaistCategorycmtoin == false
            ? ConstantData.inchestocm(double.parse(waistController.text))
            .round()
            .toString()
            : waistController.text;
        onchangeWaistCategorycmtoin = true;
      } else {
        selectCurrency = currencyList[1].value;
        waistController.text =
        onchangeWaistCategorycmtoin == null ||
            onchangeWaistCategorycmtoin == true?ConstantData.cmtoinches(double.parse(waistController.text))
            .round()
            .toString():waistController.text;
        onchangeWaistCategorycmtoin = false;
      }
    });
  }
  setdataNeckData() {
    setState(() {
      if (centimeter!) {
        selectNeck = cnList[0].value;
        neckController.text = onchangeNeckCategorycmtoin == null ||
            onchangeNeckCategorycmtoin == false
            ? ConstantData.inchestocm(double.parse(neckController.text))
            .round()
            .toString()
            : neckController.text;
        onchangeNeckCategorycmtoin = true;
      } else {
        selectCurrency = currencyList[1].value;
        neckController.text =
        onchangeNeckCategorycmtoin == null ||
            onchangeNeckCategorycmtoin == true?ConstantData.cmtoinches(double.parse(neckController.text))
            .round()
            .toString():neckController.text;
        onchangeNeckCategorycmtoin = false;
      }
    });
  }
  setDefaultData() async {
    int age = await PrefData.getAge();
    int gender = await PrefData.getGender();
    double weight = await PrefData.getWeight();
    double waist = await PrefData.getWaistsize();
    double neck = await PrefData.getNecksize();
    kg = await PrefData.getKG();
    double height = await PrefData.getHeight();
    centimeter = await PrefData.getCM();
    kg = await PrefData.getKG();
    ageController.text = age.toString();

    selectGender = genderList[gender].value;
setState(() {
  waistController.text = waist.toString();
  neckController.text = neck.toString();
});
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

    // selectCurrency = currencyList[0].value;
    selectWaist = cnList[0].value;
    selectNeck = cnList[0].value;
    selectHip = femaleList[0].value;
    selectWrist = femaleList[0].value;
    selectArm = femaleList[0].value;

    if (kg!) {
      selectCurrency = currencyList[0].value;
      weightController.text = weight.round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }

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


  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    rowItem = widget.rowItem??ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    print("waist is ======== ======= ${wristController.text}");
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      reset();
    }, "Body Fat", "Body Fat 2.svg", ConstantData.bodyfatColor,"A measure of fitness level of an individual",(){Get.back();},
        adsFile: adsFile);










  }
getWidget(){
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
                          string??"", 15.sp, ConstantData.grayColor, 1,
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
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Waist", 17.sp, ConstantData.textColor, 1,
            fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(
            context, selectWaist??"", cnList, (value) {
          setState(() {
            selectWaist = value;
            centimeter = (selectWaist==S.of(context).centimeter);
          });
          setdataWaistData();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(
          waistController,
          S.of(context).enterWaist,
          suffixWidget: Container(
              height: 54.h,
              width: 54.h,
              child: Center(
                  child: getCustomFont(
                      "(${(selectWaist == 'Inches' ? "In" : "Cm")})", 15.sp,
                      ConstantData.grayColor, 1,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center))),
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Neck", 17.sp, ConstantData.textColor, 1,
            fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(
            context, selectNeck??"", cnList, (value) {
          setState(() {
            selectNeck = value;
            centimeter = (selectNeck==S.of(context).centimeter);

          });
          setdataNeckData();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(neckController, S.of(context).enterNeck,
            textInputAction: (selectGender == S.of(context).male)
                ? (selectGender == S.of(context).male)
                ? TextInputAction.done
                : TextInputAction.next
                : TextInputAction.next, suffixWidget: Container(
                height: 54.h,
                width: 54.h,
                child: Center(
                    child: getCustomFont(
                        "(${(selectNeck == 'Inches' ? "In" : "Cm")})", 15.sp, ConstantData.grayColor, 1,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center)))).paddingSymmetric(horizontal: 20.h),


        getVerSpace(24.h),
        custumButton(() {calculate();}, "Calculate",
            color: ConstantData.bodyfatColor,
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
  maleCalculate() {
    double weight=0;
    double waist=0;

    bool check = false;

    if (ConstantData.check(ftController.text)) {
    } else {
      check = true;
    }

    if (!centimeter!) {
      if (ConstantData.check(inchController.text)) {
      } else {
        check = true;
      }
    }

    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    } else {
      check = true;
    }
    if (ConstantData.check(waistController.text)) {
      waist = double.parse(waistController.text);
    } else {
      check = true;
    }
    if (ConstantData.check(neckController.text)) {
    } else {
      check = true;
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (kg!) {
        weight =weight* 2.20462;
      }

      if (centimeter!) {
      } else {
      }

      if (selectWaist == S.of(context).centimeter) {
        waist *= 0.393701;
      }
      if (selectNeck == S.of(context).centimeter) {
      }

      double result1 = (weight * 1.082) + 94.42;
      double result2 = result1 - (waist * 4.15);

      double bf = ((weight - result2) * 100.0) / weight;
      String strAssess;
      if (bf >= 2.0 && bf <= 5.0) {
        strAssess = S.of(context).essentialOfFat;
      } else if (bf >= 6.0 && bf <= 13.0) {
        strAssess = S.of(context).typicalAthlete;
      } else if (bf >= 14.0 && bf <= 17.0) {
        strAssess = S.of(context).physicallyFit;
      } else if (bf < 18.0 || bf > 24.0) {
        strAssess = S.of(context).obese;
      } else {
        strAssess = S.of(context).acceptable;
      }

      String strBf = ConstantData.formatData(bf);




      sendPage(strBf, strAssess);
    }
  }

  calculate() {
    if (selectGender == S.of(context).male) {
      maleCalculate();
    } else {
      femaleCalculate();
    }
  }

  void reset() {
    ageController.text = "";
    ftController.text = "";
    inchController.text = "";
    weightController.text = "";
    waistController.text = "";
    neckController.text = "";
    wristController.text = "";
    hipController.text = "";
    forArmController.text = "";
    checkData(centimeter!);
    setState(() {});
  }

  void femaleCalculate() {
    double? weight;
    double? waist;
    double? forearm;
    double? wrist;
    double? hip;
    bool check = false;

    if (ConstantData.check(ftController.text)) {
    } else {
      check = true;
    }

    if (!centimeter!) {
      if (ConstantData.check(inchController.text)) {
      } else {
        check = true;
      }
    }

    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    } else {
      check = true;
    }
    if (ConstantData.check(waistController.text)) {
      waist = double.parse(waistController.text);
    } else {
      check = true;
    }
    if (ConstantData.check(neckController.text)) {
    } else {
      check = true;
    }

    if (ConstantData.check(forArmController.text)) {
      forearm = double.parse(forArmController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(wristController.text)) {
      wrist = double.parse(wristController.text);
    } else {
      check = true;
    }

    if (ConstantData.check(hipController.text)) {
      hip = double.parse(hipController.text);
    } else {
      check = true;
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (kg!) {
        weight =weight!* 2.20462;
      }

      if (centimeter!) {
      } else {
      }

      if (selectWaist == S.of(context).centimeter) {
        waist =waist!* 0.393701;
      }
      if (selectNeck == S.of(context).centimeter) {
      }

      if (selectArm == S.of(context).centimeter) {
        forearm =forearm!* 0.393701;
      }

      if (selectWrist == S.of(context).centimeter) {
        wrist =wrist!* 0.393701;
      }
      if (selectHip == S.of(context).centimeter) {
        hip =hip!* 0.393701;
      }

      double result3 =
          (((((weight! * 0.0732) + 8.987) + (wrist! / 3.14)) - (waist! * 0.157)) -
              (hip! * 0.249)) +
              (forearm! * 0.434);

      double bf = ((weight - result3) * 100.0) / weight;
      String strAssess;
      if (bf >= 10.0 && bf <= 13.0) {
        strAssess = S.of(context).essentialOfFat;
      } else if (bf >= 14.0 && bf <= 20.0) {
        strAssess = S.of(context).typicalAthlete;
      } else if (bf >= 21.0 && bf <= 24.0) {
        strAssess = S.of(context).physicallyFit;
      } else if (bf < 25.0 || bf > 31.0) {
        strAssess = S.of(context).obese;
      } else {
        strAssess = S.of(context).acceptable;
      }
      String strBf = ConstantData.formatData(bf);


      sendPage(strBf, strAssess);
    }
  }


  sendPage(String value1,String value2){

    resultModel = new ResultModel();
    resultModel!.value1 = value1;
    resultModel!.value2 = value2;

    showInterstitialAd(adsFile, (){
      passData();
    });



  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, BodyFatResultPage(resultModel!, rowItem!));
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
