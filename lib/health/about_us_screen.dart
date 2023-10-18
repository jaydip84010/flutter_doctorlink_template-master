import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}
class _AboutUsScreenState extends State<AboutUsScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      backgroundColor: ConstantData.bgColor,
      body: SafeArea(child: Column(
        children: [
          Container(decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(0, 4),blurRadius: 22,
                    color: ConstantData.shadowColor.withOpacity(0.20)
                )
              ],
              color: ConstantData.bgColor
          ),child: appBar((){
            Get.back();
          },text: "About us",).paddingSymmetric(vertical: 16.h,horizontal: 20.h)),
          getVerSpace(24.h),
          Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.h))
          ),child: getAssetImage("about_us_image.png",height: 161.h,width: double.infinity,boxFit: BoxFit.fill)).paddingSymmetric(horizontal: 20.h),
          getVerSpace(16.h),
          Expanded(child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            children: [
getMultilineCustomFont("Social well-being and not merely the absencer of disease", 17.sp, ConstantData.textColor,fontWeight: FontWeight.w700),
              getVerSpace(16.h),
              getMultilineCustomFont("Vorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. velit officia consequat duis enim velit mollit. exercitation veniam consequat sunt nostrud amet.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat volutpat. curabitur fringilla in purus eget egestas. Etiam quis.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat volutpat. curabitur fringilla in purus eget egestas. etiam quis.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. aliquam erat volutpat. curabitur fringilla in purus eget egestas. etiam quis.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. aliquam erat volutpat. curabitur fringilla in purus eget egestas. etiam quis.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
              getMultilineCustomFont("In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat volutpat. Curabitur fringilla in purus eget egestas. Etiam quis.", 15.sp, ConstantData.textColor,fontWeight: FontWeight.w400,txtHeight: 1.5.h),
              getVerSpace(16.h),
            ],
          ))
        ],
      )),
    ), onWillPop: () async {
      Get.back();
      return true;
    },);
  }
}
