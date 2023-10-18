import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyFatResultPage extends StatefulWidget {
  final ResultModel resultModel;
  final RowItem rowItem;

  BodyFatResultPage(this.resultModel, this.rowItem);

  @override
  _BodyFatResultPage createState() {
    return _BodyFatResultPage();
  }
}

class _BodyFatResultPage extends State<BodyFatResultPage> {
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

    return ConstantWidget.getSubDefaultWidget(context, getMainWidget(), rowItem!, _requestPop,);



  }

  getMainWidget(){
    double sliderHeight = SizeConfig.safeBlockVertical !* 12;

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
          margin: EdgeInsets.all(
              defaultMargin),
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
          margin: EdgeInsets.all(
              defaultMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ConstantWidget.getDefaultTextWidget(
                  widget.resultModel.value1??"",
                  TextAlign.center,
                  FontWeight.bold,
                  ConstantWidget.getWidthPercentSize(context, 7),
                  ConstantData.textColor),
              ConstantWidget.getDefaultTextWidget(
                  "%",
                  TextAlign.center,
                  FontWeight.w400,
                  ConstantWidget.getWidthPercentSize(context, 5),
                  ConstantData.textColor)
            ],
          ),
        ),


        Container(

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).assessment+"  ",
                  TextAlign.center,
                  FontWeight.w500,
                  ConstantWidget.getWidthPercentSize(context, 4),
                  ConstantData.textColor),
              ConstantWidget.getDefaultTextWidget(
                  widget.resultModel.value2??"",
                  TextAlign.center,
                  FontWeight.bold,
                  ConstantWidget.getWidthPercentSize(context, 4),
                  ConstantData.textColor)
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(right:
          defaultMargin,left: defaultMargin,top:(defaultMargin+defaultMargin)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              top: ConstantWidget.getWidthPercentSize(
                  context, 1.5)),
          padding: EdgeInsets.only(bottom: ConstantWidget.getScreenPercentSize(
              context, 0.2)),
          decoration: ConstantWidget.getDecoration(context, themeColor),

          child: Column(
            children: [

              getWidget(
                  S.of(context).category, S.of(context).women,S.of(context).men,true),

              Container(
                margin: EdgeInsets.symmetric(vertical: ConstantWidget.getScreenPercentSize(
                    context, 0.2),),
                height: ConstantWidget.getScreenPercentSize(
                    context, 0.2),
                color: themeColor,
              ),

              getWidget(
                  S.of(context).essentialOfFat, "10 - 13","2 - 5",false),


              getWidget(
                  S.of(context).typicalAthlete, "14 - 20","6 - 13",false),


              getWidget(
                  S.of(context).physicallyFit, "21 - 24","14 - 17",false),

              getWidget(
                  S.of(context).acceptable, "25 - 31","18 - 24",false),

              getWidget(
                  S.of(context).obese, "32% or more","25% or more",false),

            ],
          ),
        ),
      ],
    );
  }

  getWidget(String s, String s1, String s3,bool isBold) {
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
                  s, FontWeight.w800, 1, textSize,  ConstantData.textColor),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
              ConstantWidget.textOverFlowWidget(s1, f, 1, textSize,  ConstantData.textColor),
            ),

            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
              ConstantWidget.textOverFlowWidget(s3, f, 1, textSize,  ConstantData.textColor),
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
