import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/page/ResultPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class IdealWeightScreen extends StatefulWidget {


  final RowItem? rowItem;

  const IdealWeightScreen({Key? key,this.rowItem}) : super(key: key);

  @override
  State<IdealWeightScreen> createState() => _IdealWeightScreenState();
}

class _IdealWeightScreenState extends State<IdealWeightScreen>
    implements AdsInterfaces {
  Color themeColor = ConstantData.primaryColor;
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
    centimeter = await PrefData.getCM();
    ageController.text = age.toString();

    selectGender = genderList[gender].value;

    if (centimeter!) {
      selectType = typeList[1].value;
      string = S.of(context).ft;
      ftController.text = ConstantData.meterToCm(height).round().toString();
    } else {
      print("age---${ageController.text.toString()}");

      selectType = typeList[0].value;
      string = S.of(context).cm;
      setState(() {
        ConstantData.meterToInchAndFeet(height, ftController, inchController);
      });
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
    rowItem =widget.rowItem?? ConstantData.getThemeColor(context);
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidgetNew(
        context, getWidget(), rowItem!, () {
      reset();
    }, "Ideal weight", "Ideal Weight.svg",Colors.transparent,
        "Weight that is believed to be maximally for a person",(){Get.back();},
        adsFile: adsFile);
  }

  Widget getWidget() {
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
        getVerSpace(24.h),
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
        getVerSpace(24.h),
        custumButton(() {
          calculate();
        }, "Calculate",
                color: Color(0xfff7843a),
                fontWeight: FontWeight.w700,
                fontsize: 16.sp,
        textcolor: Colors.white)
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
        getVerSpace(16.h),

      ],
    );
  }

  calculate() {
    double height = 0;
    bool check = false;

    if (centimeter!) {
      if (ConstantData.check(ftController.text)) {
        height = double.parse(ftController.text);
      } else {
        check = true;
      }
    } else {
      int h1 = 0, h2 = 0;
      if (ConstantData.check(ftController.text)) {
        h1 = int.parse(ftController.text);
      } else {
        check = true;
      }
      if (ConstantData.check(inchController.text)) {
        h2 = int.parse(inchController.text);
      } else {
        check = true;
      }
      double iww = ConstantData.feetAndInchToMeter(h1, h2);
      height = ConstantData.meterToCm(iww).roundToDouble();
    }

    if (ConstantData.check(ageController.text)) {
    } else {
      check = true;
    }

    if (check) {
      ConstantData.showToast(S.of(context).pleaseEnterValidValues, context);
      check = false;
    } else {
      if (height < 153) {
        ConstantData.showToast(
            S.of(context).youMustBeOver153CmToCalculateIdealWeight, context);
      } else {
        height *= 0.393701;
        height -= 60.0;

        double id;

        if (selectGender == S.of(context).male) {
          id = (height * 1.9) + 52.0;
        } else {
          id = (height * 1.7) + 49.0;
        }

        String value1 = ConstantData.formatData(id);

        id *= 2.20462;

        String value2 = ConstantData.formatData(id);
        resultModel = new ResultModel();
        resultModel!.value1 = value1;
        resultModel!.value2 = value2;

        showInterstitialAd(adsFile, () {
          passData();
        });

      }
    }
  }

  void reset() {
    ageController.text = "";
    ftController.text = "";
    inchController.text = "";
    checkData(centimeter!);
    setState(() {});
  }

  void passData() {
    ConstantWidget.sendData(
        context, resultModel!, ResultPage(resultModel!, rowItem!));
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
