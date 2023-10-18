

import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/src/ad_containers.dart';

import 'package:doctorapp/generated/l10n.dart';
import '../model/RowItem.dart';
import '../model/ScreenArguments.dart';
import '../utils/ConstantData.dart';
import '../utils/PrefData.dart';
import 'edit_profile_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> implements AdsInterfaces {
  bool centimeter = false;
  bool kg = false;
  int? age;
  int? gender;
  double height=0;
  double? weight;
  String? selectGender;
  String? selectCurrency;
  String? selectType;
  String string = "";
  List<DropdownMenuItem<String>> genderList = [];
  List<DropdownMenuItem<String>> typeList = [];
  List<DropdownMenuItem<String>> currencyList = [];
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();
  RowItem? rowItem;
  setDefaultData() async {
     age = await PrefData.getAge();
     gender = await PrefData.getGender();
     height = await PrefData.getHeight();
     weight = await PrefData.getWeight();
    centimeter = await PrefData.getCM();
    kg = await PrefData.getKG();


    selectGender = genderList[gender!].value;

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
      weightController.text = weight!.round().toString();
    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight!).round().toString();
    }
    checkData(centimeter);
    setState(() {});
  }
  void initState() {
    // TODO: implement initState
    super.initState();

    ConstantWidget.getInterstitialAd(() {
      sendPage(rowItem!);
    }, this );


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
  sendPage(RowItem? rowItem) {
    if (rowItem != null) {
      print("pagfenae,-----${rowItem.pageName}");
      if (rowItem.pageName!.isNotEmpty && rowItem.pageName != null) {

        Navigator.pushNamed(
          context,
          "/" + rowItem.pageName!,
          // arguments: rowItem,
          arguments: ScreenArguments(rowItem),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    print("value is=========");
    print("${age}");
    print("${gender}");
    print(height);
    print(weight);
    print(centimeter);
    print(kg);
    initializeScreenSize(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: ConstantData.bgColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 4),blurRadius: 22,
                        color: ConstantData.shadowColor.withOpacity(0.20)
                    )
                  ],
                  color: ConstantData.bgColor
              ),child: appBar((){
                Get.back();
              },text: "My Profile",).paddingSymmetric(vertical: 16.h,horizontal: 20.h)),
              Expanded(
                child: Column(
                  children: [
                    getVerSpace(24.h),
                    get_profile_data("Gender", gender==0?"Men":"Female"),
                    getVerSpace(16.h),
                    get_profile_data("Weight", weight.toString()),
                    getVerSpace(16.h),
                    get_profile_data("Height", (height! * 100).toString()),
                  ],
                ),
              ),
              Align(
                child:  ConstantWidget.getBottomButton(context, "Edit profile",
                        () {
                      // PrefData.setIntro(false);
                      // Get.to(IntroPage());
                      Get.to(EditProfileScreen())!.then((value){
                        setState(() async {
                          setDefaultData();
                        });});;
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

  get_profile_data(title, text){
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.h)),
          color: ConstantData.tabContainerBgColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCustomFont(title, 17.sp, ConstantData.myprofilegrayTextColor, 1,fontWeight: FontWeight.w400),
          getCustomFont(text, 21.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w700),
        ],
      ).paddingSymmetric(vertical: 24.h,horizontal: 32.h),
    ).paddingSymmetric(horizontal: 20.h);
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
