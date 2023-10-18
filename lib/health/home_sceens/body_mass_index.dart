import 'package:doctorapp/health/page/BodyMassResultPage.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../model/ResultModel.dart';
import '../model/RowItem.dart';
import '../page/ChartPage.dart';
import '../utils/AdsFile.dart';
import '../utils/PrefData.dart';

class BodyMassIndexScreen extends StatefulWidget {

  final RowItem? rowItem;

  const BodyMassIndexScreen({Key? key,this.rowItem}) : super(key: key);



  @override
  State<BodyMassIndexScreen> createState() => _BodyMassIndexScreenState();
}

class _BodyMassIndexScreenState extends State<BodyMassIndexScreen>
    implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  String weghtstring = "Pounds";
  TextEditingController ageController = new TextEditingController();
  bool? centimeter;
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  String? selectGender = "";
  String? selectType = "";
  String string = "";
  AdsFile? adsFile;
  bool? onchangeWeightCategorykgtopou;
  TextEditingController weightController = new TextEditingController();
  bool? kg;

  List<DropdownMenuItem<String>> currencyList = [];
  String? selectCurrency = "";

  
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
    centimeter = await PrefData.getCM();
    kg = await PrefData.getKG();
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
      selectCurrency = currencyList[0].value;
      weightController.text = ConstantData.poundToKg(weight).round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }
    checkData(centimeter!);
    setState(() {});
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

    print("pagfenae,-----/${widget.rowItem!.color}");
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);



    return ConstantWidget.getMainDefaultWidgetNew(
        context,
        getWidget(),
        rowItem!,
        () {
          reset();
        },
        "Body mass index",
        "body_mass_icon.svg",
        ConstantData.bodymassindexColor,
        "Shows wheather people have the right weight for height",
        () {
          Get.back();
        },
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
                          string, 15.sp, ConstantData.grayColor, 1,
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
            weghtstring = kg! ? 'Kg' : 'Pound';
          });
          setdata();
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(
          weightController,
          S.of(context).enterWeight,
          textInputAction: (bool == true)
                  ? TextInputAction.done
                  : TextInputAction.next
              ,
          suffixWidget: Container(
              height: 54.h,
              width: 75.h,
              child: Center(
                  child: getCustomFont(
                      "(${weghtstring})", 15.sp, ConstantData.grayColor, 1,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center))),
        ).paddingSymmetric(horizontal: 20.h),

        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
                color: ConstantData.bodymassindexColor,
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

  calculate() {
    double? height;
    double? height2;
    double? weight;
    double? age;
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
      if (centimeter!) {
        height = height! / 100.0;
      } else {
        height = height! * 12.0;
        height = height + height2!;
        height *= 0.0254;
      }
      if (!kg!) {
        weight = weight! * 0.453592;
      }

      PrefData.setAge(age!.toInt());
      print("bmi----$weight=====$height");

      double bmi = (weight! / (height * height));

      resultModel = new ResultModel();
      resultModel!.value1 = ConstantData.formatData(bmi);



      showInterstitialAd(adsFile, () {
        passData();
      });

    }
  }

  void reset() {
    ageController.text = "";
    ftController.text = "";
    inchController.text = "";
    weightController.text = "";
    checkData(centimeter!);
    setState(() {});
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, BodyMassResultPage(resultModel!, rowItem!));
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
