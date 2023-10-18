import 'package:doctorapp/health/data/DataFile.dart';
import 'package:doctorapp/health/home_sceens/latest_blog_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/LatestBlogModel.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';

class LatestBlogScreen extends StatefulWidget {
  const LatestBlogScreen({Key? key}) : super(key: key);

  @override
  State<LatestBlogScreen> createState() => _LatestBlogScreenState();
}

class _LatestBlogScreenState extends State<LatestBlogScreen> {

  List<LatestBlogModel> blogList = [];

  @override
  Widget build(BuildContext context) {

    initializeScreenSize(context);

    blogList = DataFile.getAllLatestData(context);

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
          },text: "Latest blog",).paddingSymmetric(vertical: 16.h,horizontal: 20.h)),
          Expanded(
            child: ListView.builder(
              itemCount: blogList.length,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemBuilder: (context, index) {

                LatestBlogModel blog = blogList[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LatestBlogDetailScreen(blog: blog),
                      ));
                },
                child: Container(
                  height: 258.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.h,vertical: 8.h),
                  decoration: BoxDecoration(
                    color: ConstantData.ContainerbgColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: ConstantData.shadowColor
                            .withOpacity(0.25),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Expanded(child: Container(
                        decoration: BoxDecoration(

                            image: DecorationImage(image: AssetImage("${ConstantData.assetsPath + blog.image!}"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(16.h))
                        ),
                      )),

                      getVerSpace(16.h),
                      getCustomFont(blog.title ?? "", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                      getVerSpace(4.h),


                    ],

                  ),
                ),
              );
            },),
          ),
        ],
      )),
    ), onWillPop: ()async {
      Get.back();
      return false;});
  }
}
