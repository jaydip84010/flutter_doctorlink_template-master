import 'package:flutter/material.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';

class BloodPressureResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  BloodPressureResultPage(this.resultModel, this.rowItem);

  @override
  _BloodPressureResultPage createState() {
    return _BloodPressureResultPage();
  }
}

class _BloodPressureResultPage extends State<BloodPressureResultPage> {
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

    return ConstantWidget.getSubDefaultWidget(context, getMainWidget(), rowItem!, _requestPop);

  }

  getMainWidget(){
    double defaultMargin = ConstantWidget.getScreenPercentSize(context, 2);


    double width = ConstantWidget.getScreenPercentSize(context, 12);
    double height = ConstantWidget.getScreenPercentSize(context, 8);
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
                color: themeColor,
                height: containerHeight,
                width: containerHeight,
                padding: EdgeInsets.all(ConstantWidget.getPercentSize(containerHeight, 20)),

                child: Center(
                  child: Image.asset(
                    ConstantData.assetsPath + rowItem!.image,
                    color: Colors.white,
                    height: height,
                    width: width,
                  ),
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
          margin: EdgeInsets.all(defaultMargin),
          child: ConstantWidget.getDefaultTextWidget(
              widget.resultModel.value1??"",
              TextAlign.center,
              FontWeight.bold,
              ConstantWidget.getWidthPercentSize(
                  context, 7),
              themeColor),
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
