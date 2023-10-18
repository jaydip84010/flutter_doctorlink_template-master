import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterIntakeResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  WaterIntakeResultPage(this.resultModel, this.rowItem);

  @override
  _WaterIntakeResultPage createState() {
    return _WaterIntakeResultPage();
  }
}

class _WaterIntakeResultPage extends State<WaterIntakeResultPage> {
  Color themeColor = ConstantData.primaryColor;
  RowItem? rowItem;

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = widget.rowItem;
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidget(context, getMainWidget(), rowItem!, _requestPop,"Water intake");




  }

  getMainWidget() {
    double defaultMargin = ConstantWidget.getScreenPercentSize(context, 2);

    double containerHeight = ConstantWidget.getScreenPercentSize(context, 8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(defaultMargin),
          alignment: Alignment.center,
          child: Wrap(
            children: [
              Container(

                height: 126.h,
                width: 126.h,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60.h),
                        topLeft: Radius.circular(60.h),
                        bottomRight: Radius.circular(16.h),
                        bottomLeft: Radius.circular(16.h))),
                padding: EdgeInsets.all(
                    ConstantWidget.getPercentSize(containerHeight, 20)),
                child: Center(
                    child: getSvgImage(
                      rowItem!.image,
                    )),
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
          margin: EdgeInsets.all(defaultMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstantWidget.getDefaultTextWidget(
                  widget.resultModel.value1??"",
                  TextAlign.center,
                  FontWeight.bold,
                  ConstantWidget.getWidthPercentSize(context, 7),
                  ConstantData.textColor),
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).glasses,
                  TextAlign.center,
                  FontWeight.w400,
                  ConstantWidget.getWidthPercentSize(context, 4),
                  ConstantData.textColor)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: ConstantWidget.getWidthPercentSize(context, 1.5)),
          padding:
              EdgeInsets.all(ConstantWidget.getScreenPercentSize(context, 1.5)),
          decoration: ConstantWidget.getDecoration(context, themeColor),
          child: ConstantWidget.getDefaultTextWidget(
              S.of(context).take23GlassesOfWaterAdditionallyIfYouExercise,
              TextAlign.center,
              FontWeight.w400,
              ConstantWidget.getWidthPercentSize(context, 4),
             Colors.black),
        ),
      ],
    );
  }

  getWidget(String s, String s1, String s3, bool isBold) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.8);

    Color color = themeColor;

    FontWeight f = (isBold) ? FontWeight.w800 : FontWeight.w400;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ConstantWidget.getScreenPercentSize(context, 1)),
      margin: EdgeInsets.symmetric(
          vertical: ConstantWidget.getScreenPercentSize(context, 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(
                  s, FontWeight.w800, 1, textSize, color),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
                  ConstantWidget.textOverFlowWidget(s1, f, 1, textSize, color),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
                  ConstantWidget.textOverFlowWidget(s3, f, 1, textSize, color),
            ),
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
          FontWeight.w500, textSize, ConstantData.textColor),
      flex: 1,
    );
  }
}
