import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/WaterIntakeResultPage.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WaterIntakeScreen extends StatefulWidget {
  final RowItem? rowItem;

  const WaterIntakeScreen({Key? key,this.rowItem}) : super(key: key);


  @override
  State<WaterIntakeScreen> createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> implements AdsInterfaces{
  Color themeColor = ConstantData.primaryColor;
  bool? onchangeWeightCategorykgtopou;
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  bool kg=false;
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
  @override
  Widget build(BuildContext context) {
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      reset();
    }, "Water intake",
        "water_intake_icon.svg",
        ConstantData.waterintakeColor,
        "A measure of fitness level of an individual",(){Get.back();},
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
        getTextField(
          ageController,
          S.of(context).enterAge,
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

        ConstantWidget.getDropDown(
            context, selectCurrency??"", currencyList,
                (value) {
              setState(() {
                selectCurrency = value;

                kg = (selectCurrency ==
                    S.of(context).kilogram);
                setdata();
              });
            }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(weightController, S.of(context).enterWeight,




          suffixWidget:  Container(
              height: 54.h,
              width: 75.h,
              child: Center(
                  child: getCustomFont(
                      "(${kg!?'kg':'pound'})", 15.sp, ConstantData.grayColor, 1,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center))),).paddingSymmetric(horizontal: 20.h),
        getVerSpace(32.h),
        custumButton(() {calculate();}, "Calculate",
            color: ConstantData.waterintakeColor,
            fontWeight: FontWeight.w700,
            textcolor: Colors.black,
            fontsize: 16.sp)
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
