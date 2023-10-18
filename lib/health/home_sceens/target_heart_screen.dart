import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../page/HeartRateResultPage.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';

import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class TargetHeartScreen extends StatefulWidget {



  final RowItem? rowItem;

  const TargetHeartScreen({Key? key,this.rowItem}) : super(key: key);



  @override
  State<TargetHeartScreen> createState() => _TargetHeartScreenState();
}

class _TargetHeartScreenState extends State<TargetHeartScreen> implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
  TextEditingController ageController = new TextEditingController();
  TextEditingController heartRateController = new TextEditingController();
  RowItem? rowItem;
  List<DropdownMenuItem<String>> genderList=[];
  List<DropdownMenuItem<String>> typeList=[];
  String? selectGender="";
  double? factor1;
  double? factor2;
  String? selectType="";


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
    int heartRate = await PrefData.getHeartRate();

    ageController.text = age.toString();
heartRateController.text = heartRate.toString();

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


  @override
  Widget build(BuildContext context) {

    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);
    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      reset();
    },  "Target heart",
        "target_heart_icon.svg",
        ConstantData.targetheartColor,
        "A measure of fitness level of an individual",(){Get.back();},
        adsFile: adsFile);
  }

  getWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        getCustomFont("Heart Rate", 17.sp, ConstantData.textColor, 1,
            fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        getTextField(heartRateController, S.of(context).enterRestingHeartRate).paddingSymmetric(horizontal: 20),
        getVerSpace(12.h),
        Divider(
          color: ConstantData.lightgrayColor,
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(12.h),
        getCustomFont("Hart Category", 17.sp, ConstantData.textColor, 1,
            fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(16.h),
        ConstantWidget.getDropDown(
            context, selectType!, typeList, (value) {
          setState(() {
            selectType = value;
            setFactor();
          });
        }).paddingSymmetric(horizontal: 20.h),
        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
            color: ConstantData.targetheartColor,
            textcolor: Colors.black,
            fontWeight: FontWeight.w700,
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


      ],
    );
  }

  calculate() {
    double rhr=0;
    double mhr=0;
    double age=0;
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

      showInterstitialAd(adsFile,(){
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
