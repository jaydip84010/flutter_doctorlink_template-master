import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../page/BloodVolumeResultPage.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/ads_interface.dart';

class BloodVolumeScreen extends StatefulWidget {

  final RowItem? rowItem;

  const BloodVolumeScreen({Key? key,this.rowItem}) : super(key: key);








  @override
  State<BloodVolumeScreen> createState() => _BloodVolumeScreenState();
}

class _BloodVolumeScreenState extends State<BloodVolumeScreen>
    implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  bool? onchangeWeightCategorykgtopou;
  TextEditingController weightController = new TextEditingController();
  bool? centimeter;
  bool? kg;
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> typeList = [];
  List<DropdownMenuItem<String>> currencyList = [];
  String? selectCurrency = "";
  String? selectType = "";
  String string = "";
  String weghtstring = "Pounds";

  
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
        typeList = buildAndGetDropDownMenuItems(
            [S.of(context).foot, S.of(context).centimeter]);

        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);
        selectType = typeList[0].value;

        string = S.of(context).ft;

        setDefaultData();
      });
    });
  }

  setDefaultData() async {
    double height = await PrefData.getHeight();
    double weight = await PrefData.getWeight();
    centimeter = await PrefData.getCM();
    kg = await PrefData.getKG();

    if (centimeter!) {
      selectType = typeList[1].value;
      string = S.of(context).cm;
      ftController.text = ConstantData.meterToCm(height).round().toString();
    } else {
      selectType = typeList[0].value;
      string = S.of(context).ft;
      setState(() {
        ConstantData.meterToInchAndFeet(height, ftController, inchController);
      });
    }

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



  setData() {
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
  @override
  Widget build(BuildContext context) {
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
          reset();
    }, "Blood Volume",
        "blood_volume_icon.svg",
        ConstantData.bloodvolumeColor,
        "A measure of fitness level of an individual",(){Get.back();},
        adsFile: adsFile);


  }

  getWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getVerSpace(32.h),
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

        ConstantWidget.getDropDown(context, selectCurrency!, currencyList,
                (value) {
              setState(() {
                selectCurrency = value;
                // string = 'Pounds';
                kg = (selectCurrency == S.of(context).kilogram);
                weghtstring = kg! ? 'Kg' : 'Pound';
              });
              setData();
            }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(
          weightController,
          S.of(context).enterWeight,
          textInputAction:

               (bool == true)
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
            color: ConstantData.bloodvolumeColor,
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
    double height = 0;
    double height2 = 0;
    double weight = 0;
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
        height /= 100.0;
      } else {
        height *= 12.0;
        height += height2;
        height *= 2.54;
        height /= 100.0;
      }
      if (!kg!) {
        weight *= 0.453592;
      }

      weight *= 0.03219;
      weight += 0.6041;
      height = height * height * height;
      height *= 0.3669;

      print("bmi----$weight=====$height");

      double bloodVol = weight + height;

      resultModel = new ResultModel();
      resultModel!.value1 = ConstantData.formatData(bloodVol);

      showInterstitialAd(adsFile, () {
        passData();
      });
    }
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, BloodVolumeResultPage(resultModel!, rowItem!));
  }



  void reset() {
    ftController.text = "";
    inchController.text = "";
    weightController.text = "";
    checkData(centimeter!);
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
