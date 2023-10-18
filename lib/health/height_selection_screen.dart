import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/weight_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'package:doctorapp/generated/l10n.dart';

class HeightSelectionScreen extends StatefulWidget {
  const HeightSelectionScreen({Key? key}) : super(key: key);

  @override
  State<HeightSelectionScreen> createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  Future<bool> _requestPop() {
    if (_position > 0) {
      _position--;
      controller.jumpToPage(_position);
    } else {
      Future.delayed(const Duration(milliseconds: 200), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }

    return new Future.value(false);
  }

  final controller = PageController();

  bool isMale = true;
  int _position = 0;

  List<DropdownMenuItem<String>> typeList = [];

  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();

  String? selectType;
  String string = "";
  bool? centimeter;



  setGender() async {
    int gender = await PrefData.getGender();

    if (gender == 0) {
      isMale = true;
    } else {
      isMale = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setGender();
    Future.delayed(Duration.zero, () {
      setState(() {
        typeList = buildAndGetDropDownMenuItems(
            [S.of(context).foot, S.of(context).centimeter]);

        selectType = typeList[0].value;

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
    double height = await PrefData.getHeight();
    centimeter = await PrefData.getCM();

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
                  widget: getRichtext("2", "/3",
                      firsttextSize: 17.sp,
                      secondtextSize: 17.sp,
                      firstTextwidth: FontWeight.w700,
                      secondTextwidth: FontWeight.w400),
                ),
                SizedBox(
                  height: ConstantWidget.getScreenPercentSize(context, 3),
                ),
                getCustomFont(
                    S.of(context).selectYourHeight, 27.sp, ConstantData.textColor, 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(16.h),
                getMultilineCustomFont(
                    S.of(context).youNeedToCreateANewBasicProfileWithHeight,
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
                        bool oldVal = centimeter!;

                        setState(() {
                          selectType = "Centimeter";

                          centimeter = (selectType == S.of(context).centimeter);

                          checkData(oldVal);

                          if (selectType == S.of(context).centimeter) {
                            string = S.of(context).cm;
                          } else {
                            string = S.of(context).ft;
                          }
                        });
                      },
                          selectType == S.of(context).centimeter
                              ? ConstantData.tabContainerItemBgColor
                              : ConstantData.tabContainerBgColor,
                          "Centimeter",
                          selectType == S.of(context).centimeter
                              ? ConstantData.accentColor
                              : ConstantData.textColor,
                          selectType == S.of(context).centimeter
                              ? FontWeight.w600
                              : FontWeight.w400),
                      getTabBarButton(() {
                        bool oldVal = centimeter!;

                        setState(() {
                          selectType = "Foot";

                          centimeter = (selectType == S.of(context).centimeter);

                          checkData(oldVal);

                          if (selectType == S.of(context).centimeter) {
                            string = S.of(context).cm;
                          } else {
                            string = S.of(context).ft;
                          }
                        });
                      },
                          selectType == S.of(context).centimeter
                              ? ConstantData.tabContainerBgColor
                              : ConstantData.tabContainerItemBgColor,
                          "Foot",
                          selectType == S.of(context).centimeter
                              ? ConstantData.textColor
                              : ConstantData.accentColor,
                          selectType == S.of(context).centimeter
                              ? FontWeight.w400
                              : FontWeight.w600),
                    ],
                  ).paddingSymmetric(horizontal: 2.h),
                ),
                getVerSpace(40.h),
                Expanded(
                  child: getHeightWidget(),
                  flex: 1,
                ),
                ConstantWidget.getBottomButton(context, S.of(context).next, () {

                  PrefData.setHeightScreen(false);
                  saveData();
                  Navigator.push(
                    context,
                    PageTransition(
                        type:PageTransitionType.scale,
                        child: WeightSelectionScreen(),
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

  getHeightWidget() {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 7);
    final ThemeData theme = ThemeData();
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54.h,
            child: Theme(
              data: new ThemeData(
                primaryColor: ConstantData.textColor,

                colorScheme: theme.colorScheme
                    .copyWith(secondary: ConstantData.textColor),

                hintColor: ConstantData.textColor,
              ),
              child: TextFormField(
                maxLines: 1,
                controller: ftController,
                textInputAction:
                    ((selectType == S.of(context).centimeter) )
                        ? ((selectType == S.of(context).centimeter))
                            ? TextInputAction.done
                            : TextInputAction.next
                        : TextInputAction.next,
                cursorColor: ConstantData.textColor,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],

                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: ConstantWidget.getPercentSize(cellHeight, 30),
                    color: ConstantData.textColor,
                    fontFamily: ConstantData.fontFamily,
                    fontWeight: FontWeight.w400),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16.h),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.h),
                      borderSide:
                          BorderSide(color: ConstantData.textfieldBorder)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.h),
                      borderSide: BorderSide(color: ConstantData.accentColor)),
                  suffixIcon: Container(
                      height: 54.h,
                      width: 54.h,
                      child: Center(
                          child: getCustomFont(
                              "($string)", 15.sp, ConstantData.grayColor, 1,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center))),
                  hintStyle: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: ConstantWidget.getPercentSize(cellHeight, 25),
                      color: ConstantData.textColor,
                      fontFamily: ConstantData.fontFamily,
                      fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          getVerSpace(16.h),
          Visibility(
            child: Container(
              height: 54.h,
              child: Theme(
                data: new ThemeData(
                  primaryColor: ConstantData.textColor,

                  colorScheme: theme.colorScheme
                      .copyWith(secondary: ConstantData.textColor),

                  hintColor: ConstantData.textColor,
                ),
                child: getTextField(inchController, "", suffixWidget: Container(
                    height: 54.h,
                    width: 54.h,
                    child: Center(
                        child: getCustomFont("(${S.of(context).inch})",
                            15.sp, ConstantData.hintColor, 1,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center))),
                textInputAction: ((selectType == S.of(context).foot) )
                    ? ((selectType == S.of(context).foot))
                    ? TextInputAction.done
                    : TextInputAction.next
                    : TextInputAction.next,

                  ),
              ),
            ),
            visible: (selectType == S.of(context).foot),
          ),
        ],
      ),
    );
  }

  void saveData() async {
    if (isMale) {
      PrefData.setGender(0);
    } else {
      PrefData.setGender(1);
    }

    PrefData.setCM(centimeter!);

    if (centimeter!) {
      double i = 0;

      if (ConstantData.check(ftController.text)) {
        i = double.parse(ftController.text);
      }
      PrefData.setHeight(ConstantData.cmToMeter(i));
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
    }

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
}
