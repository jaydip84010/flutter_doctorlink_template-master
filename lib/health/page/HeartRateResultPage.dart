import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartRateResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  HeartRateResultPage(this.resultModel, this.rowItem);

  @override
  _HeartRateResultPage createState() {
    return _HeartRateResultPage();
  }
}

class _HeartRateResultPage extends State<HeartRateResultPage> {
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

    return
      ConstantWidget.getMainDefaultWidget( context,
          getMainWidget(),
          rowItem!,
          _requestPop,"Target heart");


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
        getWidget(
            widget.rowItem.resultText ?? "", widget.resultModel.value1 ?? ""),
        getWidget("Your training heart rate is",
            (widget.resultModel.value2! + " - " + widget.resultModel.value3!)),
      ],
    );
  }

  getWidget(String s, String s1) {
    double defaultMargin = ConstantWidget.getScreenPercentSize(context, 4);

    return Column(
      children: [
        SizedBox(
          height: defaultMargin,
        ),

        ConstantWidget.textOverFlowWidget(
            s,
            FontWeight.w400,
            1,
            ConstantWidget.getWidthPercentSize(context, 3.8),
            ConstantData.textColor),

        SizedBox(
          height: (defaultMargin / 2),
        ),

        ConstantWidget.textOverFlowWidget(s1, FontWeight.bold, 1,
            ConstantWidget.getWidthPercentSize(context, 5),  ConstantData.textColor),

        ConstantWidget.textOverFlowWidget(
            S.of(context).beatsminute,
            FontWeight.w400,
            1,
            ConstantWidget.getWidthPercentSize(context, 4),
            ConstantData.textColor)


      ],
    );
  }
}
