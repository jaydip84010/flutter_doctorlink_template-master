import 'package:doctorapp/health/home_sceens/health_home_page.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'package:doctorapp/generated/l10n.dart';


class WeightSelectionScreen extends StatefulWidget {
  const WeightSelectionScreen({Key? key}) : super(key: key);

  @override
  State<WeightSelectionScreen> createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {
  Future<bool> _requestPop() {
    Future.delayed(const Duration(milliseconds: 200), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });

    return new Future.value(false);
  }

  final controller = PageController();

  List<DropdownMenuItem<String>> typeList = [];

  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();

  String? selectType;
  String string = "Pounds";
  bool? centimeter;
bool? onchangeWeightCategorykgtopou;
  List<DropdownMenuItem<String>> currencyList = [];

  TextEditingController weightController = new TextEditingController();

  String? selectCurrency;

  bool? isKg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);
        setDefaultData();
      });
    });
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = [];
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  setDefaultData() async {
    double weight = await PrefData.getWeight();
    isKg = await PrefData.getKG();

    if (isKg!) {
      selectCurrency = currencyList[0].value;
      weightController.text = ConstantData.poundToKg(weight).round().toString();

    } else {
      selectCurrency = currencyList[1].value;
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }
    setState(() {});
  }
  setdata(){
    setState(() {
      if (isKg!) {
        selectCurrency = currencyList[0].value;
        weightController.text = ConstantData.poundToKg(double.parse(weightController.text)).round().toString();
        onchangeWeightCategorykgtopou = true;
      } else {
        selectCurrency = currencyList[1].value;
        weightController.text = ConstantData.kgToPound(double.parse(weightController.text)).round().toString();
        isKg = true;
        onchangeWeightCategorykgtopou = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantData.bgColor,
          body: SafeArea(
            child: Column(
              children: [
                getVerSpace(16.h),
                appBar(
                  () {
                    Get.back();
                  },
                  widget: getRichtext("3", "/3",
                      firsttextSize: 17.sp,
                      secondtextSize: 17.sp,
                      firstTextwidth: FontWeight.w700,
                      secondTextwidth: FontWeight.w400),
                ),
                SizedBox(
                  height: ConstantWidget.getScreenPercentSize(context, 3),
                ),
                getCustomFont(
                    "Select your weight", 27.sp, ConstantData.textColor, 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(16.h),
                getMultilineCustomFont(
                    "You need to create a new basic profile with weight.",
                    15.sp,
                    ConstantData.textColor,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center),
                getVerSpace(40.h),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.h),
                      color: ConstantData.tabContainerBgColor),
                  child: Row(
                    children: [
                      getTabBarButton(() {
                        setState(() {
                          selectCurrency = "Kilogram";
                          string = 'KG';
//Kilogram  Pounds
                          isKg = (selectCurrency == S.of(context).kilogram);
                        });

                        onchangeWeightCategorykgtopou==null || !onchangeWeightCategorykgtopou!?setdata():(){};
                        print("iskg is $isKg");
                      },
                          selectCurrency == S.of(context).kilogram
                              ? ConstantData.bgColor
                              : ConstantData.tabContainerBgColor,
                          "Kilogram",
                          selectCurrency == S.of(context).kilogram
                              ? ConstantData.accentColor
                              : ConstantData.blackColor,
                          selectCurrency == S.of(context).kilogram
                              ? FontWeight.w600
                              : FontWeight.w400),
                      getTabBarButton(() {
                        setState(() {
                          selectCurrency = "Pounds";
                          string = 'Pounds';
//Kilogram  Pounds
                          isKg = (selectCurrency == S.of(context).kilogram);
                        });
                        onchangeWeightCategorykgtopou==null || onchangeWeightCategorykgtopou!?setdata():(){};
                        print("iskg is $isKg");

                      },
                          selectCurrency == S.of(context).kilogram
                              ? ConstantData.tabContainerBgColor
                              : ConstantData.bgColor,
                          "Pounds",
                          selectCurrency == S.of(context).kilogram
                              ? ConstantData.blackColor
                              : ConstantData.accentColor,
                          selectCurrency == S.of(context).kilogram
                              ? FontWeight.w400
                              : FontWeight.w600),
                    ],
                  ).paddingSymmetric(horizontal: 2.h),
                ),
                getVerSpace(40.h),
                Expanded(
                  child: getWeightWidget(),
                  flex: 1,
                ),
                ConstantWidget.getBottomButton(context, S.of(context).next, () {

                  PrefData.setWeightScreen(false);
                  saveData();
                  Navigator.push(
                    context,
                    PageTransition(
                        type:PageTransitionType.scale,
                        child: HealthHomePageScreen(),
                        inheritTheme: true,
                        alignment: Alignment.bottomCenter,
                        ctx: context),
                  );

                }),
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ),
        onWillPop: _requestPop);
  }

  getTabBarButton(function, bgcolor, text, textColor, fontWeight) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.h), color: bgcolor),
          child: Center(
            child:
                getCustomFont(text, 15.sp, textColor, 1, fontWeight: fontWeight)
                    .paddingSymmetric(vertical: 11.h, horizontal: 50.h),
          ),
        ).paddingSymmetric(vertical: 4.h, horizontal: 2.h),
      ),
    );
  }

  getWeightWidget() {

    final ThemeData theme = ThemeData();
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 54.h,
              child: Theme(
                  data: new ThemeData(
                    primaryColor: ConstantData.textColor,
                    colorScheme: theme.colorScheme
                        .copyWith(secondary: ConstantData.textColor),

                    hintColor: ConstantData.textColor,
                  ),
                  child: getTextField(
                    weightController,
                    S.of(context).enterWeight,
                    textInputAction: selectCurrency == S.of(context).kilogram
                        ? (selectCurrency == S.of(context).kilogram)
                            ? TextInputAction.done
                            : TextInputAction.next
                        : TextInputAction.next,
                    suffixWidget: Container(
                        height: 54.h,
                        width: 75.h,
                        child: Center(
                            child: getCustomFont(
                                "(${string})", 15.sp, ConstantData.grayColor, 1,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center))),
                  )


                  ),
            ),
          ),
        ],
      ),
    );
  }

  void saveData() async {
    PrefData.setKG(isKg!);

    double weight = 0;
    if (ConstantData.check(weightController.text)) {
      weight = double.parse(weightController.text);
    }



    if (isKg!) {

      PrefData.setWeight(weight);
    } else {

      PrefData.setWeight(ConstantData.poundToKg(weight).roundToDouble());
    }

    weight = await PrefData.getWeight();

    if (isKg!) {
      weightController.text = weight.round().toString();
    } else {
      weightController.text = ConstantData.kgToPound(weight).round().toString();
    }
  }
}
