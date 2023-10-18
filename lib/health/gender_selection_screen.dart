import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'package:doctorapp/generated/l10n.dart';
import 'height_selection_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  bool isMale = true;

  final controller = PageController();



  List<DropdownMenuItem<String>> typeList = [];

  TextEditingController ftController = new TextEditingController();
  TextEditingController inchController = new TextEditingController();

  String? selectType;
  String string = "";
  bool? centimeter;

  List<DropdownMenuItem<String>> currencyList = [];

  TextEditingController weightController = new TextEditingController();

  String? selectCurrency;

  bool? isKg;



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

        currencyList = buildAndGetDropDownMenuItems(
            [S.of(context).kilogram, S.of(context).pounds]);

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

    double weight = await PrefData.getWeight();
    isKg = await PrefData.getKG();

    if (isKg!) {
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


  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
      backgroundColor: ConstantData.bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             getVerSpace(16.h),
              appBar((){
                Get.back();
              },widget: getRichtext("1", "/3",
                  firsttextSize: 17.sp,
                  secondtextSize: 17.sp,
                  firstTextwidth: FontWeight.w700,
                  secondTextwidth: FontWeight.w400), ),
              SizedBox(
                height: ConstantWidget.getScreenPercentSize(context, 3),
              ),
              getCustomFont(S.of(context).whatsYourGender, 27.sp,
                  ConstantData.textColor, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(16.h),
              getMultilineCustomFont(
                  S.of(context).loremIpsumIsSimplyDummyTextOfThePrintingAnd,
                  15.sp,
                  ConstantData.textColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center),
             getVerSpace(48.h),

              Row(
                children: [

                  getWidget(isMale?"male_icon.svg":"male_icon_unselected.svg", S.of(context).men, isMale ? true : false,
                      () {
                    setState(() {
                      isMale = true;
                    });
                  },isMale?ConstantData.lightGrayColor:ConstantData.lightGrayColor,isMale?ConstantData.lightGrayColor:ConstantData.primaryColor),
                 getHorSpace(16.h),
                  getWidget(
                     isMale?"female_icon_unselected.svg": "female_icon.svg", S.of(context).female, isMale ? false : true,
                      () {
                    setState(() {
                      isMale = false;
                    });
                  },!isMale?ConstantData.lightGrayColor:ConstantData.lightGrayColor,!isMale?ConstantData.lightGrayColor:ConstantData.primaryColor),
                ],
              ),
              new Spacer(),
              ConstantWidget.getBottomButton(context, S.of(context).next, () {

                PrefData.setGenderScreen(false);
                saveData();
                Navigator.push(
                  context,
                  PageTransition(
                      type:PageTransitionType.scale,
                      child: HeightSelectionScreen(),
                      inheritTheme: true,
                      alignment: Alignment.bottomCenter,
                      ctx: context),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
  void saveData() async {
    if (isMale) {
      PrefData.setGender(0);
    } else {
      PrefData.setGender(1);
    }
  }
  getWidget(String icon, String name, bool selected, Function function,border,color) {
    double height = ConstantWidget.getScreenPercentSize(context, 25);



    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 246.h,
          decoration: BoxDecoration(

              color: color,
              border: Border.all(
                  width: ConstantWidget.getPercentSize(height, 1),
                  color:  border),
              borderRadius: BorderRadius.all(Radius.circular(16.h))),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getVerSpace(32.h),
              getCustomFont(name, 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w700),
                 getSvgImage(icon,height: 144.h,width: 144.h),

            ],
          ),
        ),
        onTap: () {
          print("ismale===true");
          function();
        },
      ),
      flex: 1,
    );
  }
}
