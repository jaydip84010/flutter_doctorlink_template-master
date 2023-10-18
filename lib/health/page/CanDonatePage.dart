import 'package:flutter/material.dart';
import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/page/ChartPage.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CanDonatePage extends StatefulWidget {
  final RowItem rowItem;

  CanDonatePage(this.rowItem);

  @override
  _CanDonatePage createState() {
    return _CanDonatePage();
  }
}

class _CanDonatePage extends State<CanDonatePage> {
  Color themeColor = ConstantData.primaryColor;
  RowItem? rowItem;


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setData();
    });
  }

  setData() {
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

    return ConstantWidget.getMainDefaultWidget(context, getMainWidget(), rowItem!, _requestPop,"Blood donation");

  }

  getMainWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        getWidget(S.of(context).donate1),
        getVerSpace(24.h),
        custumButton(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChartPage(rowItem!),
              ));
        }, "Blood Volume Chart",
            color: ConstantData.blooddonationColor,
            fontWeight: FontWeight.w700,
            textcolor: Colors.black,
            fontsize: 16.sp)
      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  getWidget(String s) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 2);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ConstantWidget.getScreenPercentSize(context, 1.5),horizontal:ConstantWidget.getScreenPercentSize(context, 0.5) ),
      child: ConstantWidget.getDefaultTextWidget(
          s, TextAlign.start, FontWeight.w800, textSize,  ConstantData.textColor),
    );
  }
}
