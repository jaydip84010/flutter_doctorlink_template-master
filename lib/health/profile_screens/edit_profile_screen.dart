
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controller/controller.dart';
import 'package:doctorapp/generated/l10n.dart';
import '../model/RowItem.dart';
import '../model/ScreenArguments.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';
import '../utils/PrefData.dart';
import '../utils/ads_interface.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin
    implements AdsInterfaces {
  List<String> s = ["Setting", "Home", "Profile"];
  List<RowItem> rowItemList = [];
  InterstitialAd? interstitialAd;

  RowItem? rowItem;
  MyProfileScreenController myProfileScreenController = Get.put(MyProfileScreenController());
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  bool centimeter = false;
  bool kg = false;
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  List<DropdownMenuItem<String>> currencyList = [];
  String? selectGender;
  String? selectCurrency;
  String? selectType;
  String string = "";

  void initState() {
    // TODO: implement initState
    super.initState();


    ConstantWidget.getInterstitialAd(() {
      sendPage(rowItem!);
    }, this);



    List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
      List<DropdownMenuItem<String>> items = [];
      for (String fruit in fruits) {
        items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
      }
      return items;
    }

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

    if (centimeter) {
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

    if (kg) {
      selectCurrency = currencyList[0].value;
      weightController.text = weight.round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }
    checkData(centimeter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ConstantData.bgColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 22,
                        color: ConstantData.shadowColor.withOpacity(0.20))
                  ], color: ConstantData.bgColor),
                  child: appBar(
                    () {
                      Get.back();
                    },
                    text: "Edit Profile",
                  ).paddingSymmetric(vertical: 16.h, horizontal: 20.h)),
              getVerSpace(24.h),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont("Select Gender", 17.sp, ConstantData.textColor, 1,
                      fontWeight: FontWeight.w700)
                      .paddingSymmetric(horizontal: 20.h),
                  getVerSpace(16.h),
                  (selectGender != null)
                      ? ConstantWidget.getDropDown(
                      context, selectGender!, genderList, (value) {
                    setState(() {
                      selectGender = value;
                    });
                  }).paddingSymmetric(horizontal: 20.h)
                      : SizedBox(),
                  getVerSpace(12.h),
                  Divider(
                    color: ConstantData.lightgrayColor,
                  ).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(12.h),
                  // getTextField(ageController, S.of(context).enterAge),
                  getCustomFont("Height", 17.sp, ConstantData.textColor, 1,
                      fontWeight: FontWeight.w700)
                      .paddingSymmetric(horizontal: 20.h),
                  getVerSpace(16.h),
                  (selectType != null)
                      ? ConstantWidget.getDropDown(context, selectType!, typeList,
                          (value) {
                        bool oldVal = centimeter;

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
                      }).paddingSymmetric(horizontal: 20.h)
                      : SizedBox(),
                  getVerSpace(16.h),
                  getTextField(
                    ftController,
                    S.of(context).enterHeight,
                  ).paddingSymmetric(horizontal: 20.h),

                  Visibility(
                    child: getTextField(
                      inchController,
                      S.of(context).enterHeight,
                    ).paddingSymmetric(horizontal: 20.h),
                    visible: (selectType == S.of(context).foot),
                  ).paddingOnly(top: 16.h),
                  getVerSpace(12.h),
                  Divider(
                    color: ConstantData.lightgrayColor,
                  ).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(12.h),
                  getCustomFont("Weight", 17.sp, ConstantData.textColor, 1,
                      fontWeight: FontWeight.w700)
                      .paddingSymmetric(horizontal: 20.h),
                  getVerSpace(16.h),

                  (selectCurrency != null)
                      ? ConstantWidget.getDropDown(
                      context, selectCurrency!, currencyList, (value) {
                    setState(() {
                      selectCurrency = value;

                      kg = (selectCurrency == S.of(context).kilogram);
                    });
                  }).paddingSymmetric(horizontal: 20.h)
                      : SizedBox(),
                  getVerSpace(16.h),

                  getTextField(
                    weightController,
                    S.of(context).enterWeight,
                  ).paddingSymmetric(horizontal: 20.h),
                ],
              )),

              Align(
                alignment: Alignment.bottomCenter,
                child: ConstantWidget.getBottomButton(context, "Save", () {
                  saveData();
                  Get.back();
                  // PrefData.setIntro(false);
                  // Get.to(IntroPage());
                  // Get.to(GenderSelectionScreen());
                }),
              ).paddingSymmetric(horizontal: 20.h)
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Get.back();
        return true;
      },
    );
  }

  void checkData(bool val) {
    if (centimeter != val) {
      if (centimeter) {
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

  void saveData() {
    if (selectGender == S.of(context).male) {
      PrefData.setGender(0);
      myProfileScreenController.setGender("Men");
    } else {
      PrefData.setGender(1);
      myProfileScreenController.setGender("Female");
    }

    PrefData.setCM(centimeter);

    if (centimeter) {
      double i = 0;

      if (ConstantData.check(ftController.text)) {
        i = double.parse(ftController.text);
      }
      PrefData.setHeight(ConstantData.cmToMeter(i));
      myProfileScreenController.setHeight(ConstantData.cmToMeter(i));
    } else {
      int feet = 0;
      if (ConstantData.check(ftController.text)) {
        feet = int.parse(ftController.text);
      }
      int inch = 0;
      if (ConstantData.check(inchController.text)) {
        inch = int.parse(inchController.text);
      }

      PrefData.setHeight(ConstantData.feetAndInchToMeter(feet, inch));
      myProfileScreenController.setHeight(ConstantData.feetAndInchToMeter(feet, inch));
    }

    int age = 0;
    if (ConstantData.check(ageController.text)) {
      age = int.parse(ageController.text);
    }

    PrefData.setAge(age);
    PrefData.setKG(kg);

    double weight = 0;
    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    }

    if (kg) {
      PrefData.setWeight(weight);
      myProfileScreenController.setweight(weight);
    } else {
      PrefData.setWeight(ConstantData.poundToKg(weight).roundToDouble());
      myProfileScreenController.setweight(ConstantData.poundToKg(weight).roundToDouble());
    }

    ConstantData.showToast(
        S.of(context).yourProfileSavedSuccessfullty, context);
  }

  @override
  void onAdClose() {
    // TODO: implement onAdClose
  }

  @override
  void onAdLoad(InterstitialAd interstitialAds) {
    // TODO: implement onAdLoad
  }

  sendPage(RowItem? rowItem) {
    if (rowItem != null) {
      print("pagfenae,-----${rowItem.pageName}");
      if (rowItem.pageName!.isNotEmpty && rowItem.pageName != null) {
        // Navigator.pushNamed(context, "/" + rowItem.pageName!,
        //     arguments: ScreenArguments(rowItem));

        Navigator.pushNamed(
          context,
          "/" + rowItem.pageName!,
          arguments: ScreenArguments(rowItem),
        );
      }
    }
  }





}
