import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  ResultPage(this.resultModel, this.rowItem);

  @override
  _ResultPage createState() {
    return _ResultPage();
  }
}

class _ResultPage extends State<ResultPage> {
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




    return ConstantWidget.getMainDefaultWidget(context, getMainWidget(),rowItem!, _requestPop,"Ideal weight");

  }


  getMainWidget(){
    double containerHeight = ConstantWidget.getScreenPercentSize(context, 8);

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Container(
          margin: EdgeInsets.all(ConstantWidget.getScreenPercentSize(context, 4)),
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
          margin: EdgeInsets.all(
              ConstantWidget.getScreenPercentSize(context, 2)),
          child: ConstantWidget.getDefaultTextWidget(
              widget.resultModel.value1!+" "+S.of(context).kg+" / "+widget.resultModel.value2!+" "+S.of(context).lbs,
              TextAlign.center,
              FontWeight.bold,
              ConstantWidget.getWidthPercentSize(context, 7),
              ConstantData.textColor
              // themeColor

          ),

        ),



      ],
    );
  }


}
