import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CaloriesWeightResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  CaloriesWeightResultPage(this.resultModel, this.rowItem);

  @override
  _CaloriesWeightResultPage createState() {
    return _CaloriesWeightResultPage();
  }
}

class _CaloriesWeightResultPage extends State<CaloriesWeightResultPage> {
  Color themeColor = ConstantData.primaryColor;
  RowItem? rowItem;

  String desc = "desc";
  int colorPosition = 0;

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = widget.rowItem;
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getMainDefaultWidget(
        context, getMainWidget(), rowItem!, _requestPop, "Calorias for..");
  }

  getMainWidget() {
    double sliderHeight = SizeConfig.safeBlockVertical! * 12;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 8);
    double defaultMargin = ConstantWidget.getScreenPercentSize(context, 2);

    double containerHeight = ConstantWidget.getScreenPercentSize(context, 8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: (margin * 2),
        ),
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
            widget.rowItem.resultText ?? "",
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
                  widget.resultModel.value1 ?? "",
                  TextAlign.center,
                  FontWeight.bold,
                  ConstantWidget.getWidthPercentSize(context, 7),
                  ConstantData.textColor),
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).calories,
                  TextAlign.center,
                  FontWeight.w400,
                  ConstantWidget.getWidthPercentSize(context, 4),
                  ConstantData.textColor)
            ],
          ),
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.only(bottom: (defaultMargin / 2)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstantWidget.getDefaultTextWidget(
                    widget.resultModel.value2 ?? "",
                    TextAlign.center,
                    FontWeight.bold,
                    ConstantWidget.getWidthPercentSize(context, 7),
                    ConstantData.textColor),
                ConstantWidget.getDefaultTextWidget(
                    S.of(context).caloriesday,
                    TextAlign.center,
                    FontWeight.w400,
                    ConstantWidget.getWidthPercentSize(context, 4),
                    ConstantData.textColor)
              ],
            ),
          ),
          visible: (widget.resultModel.value2!.isNotEmpty &&
              widget.resultModel.value2 != null),
        ),
        Visibility(
          child: ConstantWidget.getDefaultTextWidget(
              S.of(context).cal1,
              TextAlign.center,
              FontWeight.w400,
              ConstantWidget.getWidthPercentSize(context, 3.8),
              ConstantData.textColor),
          visible: (widget.resultModel.value2!.isNotEmpty &&
              widget.resultModel.value2 != null),
        ),
        getSpace(),
        ConstantWidget.getDefaultTextWidget(
            S.of(context).cal2,
            TextAlign.start,
            FontWeight.w400,
            ConstantWidget.getWidthPercentSize(context, 3.8),
            ConstantData.textColor),
        getSpace(),
        ConstantWidget.getDefaultTextWidget(
            S.of(context).cal3,
            TextAlign.start,
            FontWeight.w400,
            ConstantWidget.getWidthPercentSize(context, 3.8),
            ConstantData.textColor),
        getSpace(),
        ConstantWidget.getDefaultTextWidget(
            S.of(context).cal4,
            TextAlign.start,
            FontWeight.w400,
            ConstantWidget.getWidthPercentSize(context, 3.8),
            ConstantData.textColor),
        Container(
          margin: EdgeInsets.only(
              right: defaultMargin, top: (defaultMargin + defaultMargin)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).toStayHealthy,
                  TextAlign.center,
                  FontWeight.w400,
                  ConstantWidget.getWidthPercentSize(context, 4),
                  ConstantData.textColor),
              new Spacer()
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: ConstantWidget.getWidthPercentSize(context, 1.5)),
          padding: EdgeInsets.only(
              bottom: ConstantWidget.getScreenPercentSize(context, 0.2)),
          decoration: ConstantWidget.getDecoration(context, themeColor),
          child: Column(
            children: [
              getWidget(S.of(context).averageCalories, S.of(context).women,
                  S.of(context).men, true),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: ConstantWidget.getScreenPercentSize(context, 0.2),
                ),
                height: ConstantWidget.getScreenPercentSize(context, 0.2),
                color: themeColor,
              ),
              getWidget(S.of(context).maintainWeight, "2000 - 2100",
                  "2700 - 2900", false),
              getWidget(S.of(context).lossWeight, "1400 - 1800", "2200 - 2700",
                  false),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  getSpace() {
    return ConstantWidget.getSpace(
        ConstantWidget.getScreenPercentSize(context, 2));
  }

  getWidget(String s, String s1, String s3, bool isBold) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.5);
    FontWeight f = (isBold) ? FontWeight.w800 : FontWeight.w400;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ConstantWidget.getScreenPercentSize(context, 1)),
      margin: EdgeInsets.symmetric(
          vertical: ConstantWidget.getScreenPercentSize(context, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(
                  s, FontWeight.w800, 1, textSize, ConstantData.textColor),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(
                  s1, f, 1, textSize, ConstantData.textColor),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(
                  s3, f, 1, textSize, ConstantData.textColor),
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
