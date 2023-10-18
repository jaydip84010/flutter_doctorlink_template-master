import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/UnderstandBMIPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BodyMassResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  BodyMassResultPage(this.resultModel, this.rowItem);

  @override
  _BodyMassResultPage createState() {
    return _BodyMassResultPage();
  }
}

class _BodyMassResultPage extends State<BodyMassResultPage> {
  Color themeColor = ConstantData.primaryColor;
  RowItem? rowItem;
  double myNum = 0;

  int num = 0;
  String desc = "desc";
  int colorPosition = 0;



  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setData();
    });
  }

  setData() {
    String data = widget.resultModel.value1!;
    if (ConstantData.check(data)) {
      myNum = double.parse(data);
      num = myNum.toInt();

      print("num----12--" + num.toString());

      if (num < 16) {
        num = 1;

        desc = "Extremely under weight";

        colorPosition = 1;
      } else if (this.num > 40) {
        num = 100;
        desc = S.of(context).morbidObese;
        colorPosition = 7;
      } else {
        if (myNum >= 16.0 && this.myNum <= 18.5) {
          desc = S.of(context).underWeight;
          colorPosition = 2;
        } else if (this.myNum > 18.5 && this.myNum <= 25.0) {
          desc = S.of(context).normalWeight;

          colorPosition = 3;
        } else if (this.myNum > 25.0 && this.myNum <= 30.0) {
          desc = S.of(context).overWeight;

          colorPosition = 4;
        } else if (this.myNum > 30.0 && this.myNum <= 35.0) {
          desc = S.of(context).obeseClassOne;
          colorPosition = 5;
        } else if (this.myNum > 35.0 && this.myNum <= 40.0) {
          desc = S.of(context).obeseClassTwo;
          colorPosition = 6;
        } else if (this.myNum < 16.0) {
          desc = S.of(context).extremelyUnderWeight;

          colorPosition = 1;
        } else if (this.myNum > 40.0) {
          desc = S.of(context).morbidObese;
          colorPosition = 7;
        }

        num -= 15;
        num *= 4;

      }



      print("num----12----$num");
    }

    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = widget.rowItem;
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    print("countDownPercent----" + num.toString());



    return ConstantWidget.getMainDefaultWidget(context, getMainWidget(), rowItem!, _requestPop,"Body mass",);


  }

  getMainWidget (){




    double containerHeight = ConstantWidget.getScreenPercentSize(context, 10);


    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstantWidget.getDefaultTextWidget(
              desc,
              TextAlign.center,
              FontWeight.w700,
              ConstantWidget.getWidthPercentSize(context, 5),
              ConstantData.textColor),
          Container(
            margin: EdgeInsets.all(
                ConstantWidget.getScreenPercentSize(context, 2)),
            alignment: Alignment.center,
            child: Wrap(
              children: [
                Container(
                  color: themeColor,
                  height: containerHeight,
                  width: containerHeight,
                  padding: EdgeInsets.all(ConstantWidget.getPercentSize(containerHeight, 20)),

                  child: Center(
                      child: getSvgImage(rowItem!.image)
                  ),
                )
              ],
            ),
          ),
          ConstantWidget.getDefaultTextWidget(
              widget.rowItem.resultText??"",
              TextAlign.center,
              FontWeight.w400,
              ConstantWidget.getWidthPercentSize(context, 3.8),
              ConstantData.textColor),
          Container(
            margin: EdgeInsets.all(
                ConstantWidget.getScreenPercentSize(context, 2)),
            child: ConstantWidget.getDefaultTextWidget(
                widget.resultModel.value1??"",
                TextAlign.center,
                FontWeight.bold,
                ConstantWidget.getWidthPercentSize(context, 7),
                ConstantData.textColor),
          ),


          Container(
            margin: EdgeInsets.all(
                ConstantWidget.getScreenPercentSize(context, 2)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      ConstantWidget.getWidthPercentSize(
                          context, 10)),

                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: num,
                    size: ConstantWidget.getScreenPercentSize(
                        context, 5),
                    padding: 0,
                    selectedColor: Colors.yellow,
                    unselectedColor: Colors.cyan,
                    roundedEdges: Radius.circular(
                        ConstantWidget.getScreenPercentSize(
                            context, 1)),
                    selectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        themeColor,
                        themeColor.withOpacity(0.8)
                      ],
                    ),
                    unselectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black87.withOpacity(0.8),
                        Colors.grey
                      ],
                    ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      ConstantWidget.getWidthPercentSize(
                          context, 4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText("-16"),
                      getText("20"),
                      getText("25"),
                      getText("30"),
                      getText("35"),
                      getText("40+"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ConstantWidget.getWidthPercentSize(
                    context, 2.5),
                right: ConstantWidget.getWidthPercentSize(
                    context, 2.5),
                top: ConstantWidget.getWidthPercentSize(
                    context, 1.5)),

            decoration: ConstantWidget.getDecoration(context, themeColor),
            child: Column(
              children: [
                getWidget(
                    "16-", S.of(context).extremelyUnderWeight, 1),
                getWidget(
                    "16 – 18.5", S.of(context).underWeight, 2),
                getWidget(
                    "18.6 – 25", S.of(context).normalWeight, 3),
                getWidget(
                    "25.1 – 30", S.of(context).overWeight, 4),
                getWidget(
                    "30.1 – 35", S.of(context).obeseClassOne, 5),
                getWidget(
                  "35.1 – 40", S.of(context).obeseClassTwo, 6,),
                getWidget("40+", S.of(context).morbidObese, 7),
              ],
            ),
          ),
          getVerSpace(34.h),
          custumButton(color: ConstantData.bodymassindexColor,(){  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    UnderstandBMIPage(rowItem!),
              ));},S.of(context).understandYourBmiResult,textcolor: Colors.black).paddingSymmetric(horizontal: 20.h),

        ],
      ),
    );
  }

  getWidget(String s, String s1, int position) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.5);

    Color color =
        (position == colorPosition) ?  ConstantData.textColor : Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ConstantWidget.getScreenPercentSize(context, 0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ConstantWidget.getDefaultTextWidget(
                s, TextAlign.center, FontWeight.w500, textSize, color),
            flex: 1,
          ),
          Expanded(
            child: ConstantWidget.textOverFlowWidget(
                s1, FontWeight.w500, 1, textSize, color),
            flex: 1,
          )
        ],
      ),
    );
  }

  getText(String s) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.5);

    return Expanded(
      child: ConstantWidget.getDefaultTextWidget(s, TextAlign.center,
          FontWeight.w500, textSize, Colors.black),
      flex: 1,
    );
  }
}
