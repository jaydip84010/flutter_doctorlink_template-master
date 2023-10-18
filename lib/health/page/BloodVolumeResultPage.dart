import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodVolumeResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  BloodVolumeResultPage(this.resultModel, this.rowItem);

  @override
  _BloodVolumeResultPage createState() {
    return _BloodVolumeResultPage();
  }
}

class _BloodVolumeResultPage extends State<BloodVolumeResultPage> {
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

    return ConstantWidget.getMainDefaultWidget( context,
        getMainWidget(),
        rowItem!,
        _requestPop,"Blood Volume");



  }

  getMainWidget(){

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
                padding: EdgeInsets.all(
                    ConstantWidget.getPercentSize(containerHeight, 20)),
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.h),
                        topRight: Radius.circular(60.h),
                        bottomLeft: Radius.circular(16.h),
                        bottomRight: Radius.circular(16.h))),
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
                  ConstantWidget.getWidthPercentSize(
                      context, 7),
                  ConstantData.textColor),
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).liters,
                  TextAlign.center,
                  FontWeight.w400,
                  ConstantWidget.getWidthPercentSize(
                      context, 4),
                  ConstantData.textColor)
            ],
          ),
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
