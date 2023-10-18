import 'package:flutter/material.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreathCountResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  BreathCountResultPage(this.resultModel, this.rowItem);

  @override
  _BreathCountResultPage createState() {
    return _BreathCountResultPage();
  }
}

class _BreathCountResultPage extends State<BreathCountResultPage> {
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

    return ConstantWidget.getMainDefaultWidget(
        context, getMainWidget(), rowItem!, _requestPop, "Breath count");
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
            widget.rowItem.resultText ?? "",
            TextAlign.center,
            FontWeight.w400,
            ConstantWidget.getWidthPercentSize(context, 3.8),
            ConstantData.textColor),
        Container(
          margin: EdgeInsets.all(defaultMargin),
          child: ConstantWidget.getDefaultTextWidget(
              widget.resultModel.value1 ?? "",
              TextAlign.center,
              FontWeight.bold,
              ConstantWidget.getWidthPercentSize(context, 7),
              ConstantData.textColor),
        ),
      ],
    );
  }





}
