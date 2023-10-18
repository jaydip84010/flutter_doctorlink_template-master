// ignore_for_file: must_be_immutable

import 'package:doctorapp/health/data/DataFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/LatestBlogModel.dart';
import '../utils/ConstantData.dart';
import '../utils/ConstantWidget.dart';

class LatestBlogDetailScreen extends StatefulWidget {
  LatestBlogModel blog;

  LatestBlogDetailScreen({Key? key, required this.blog}) : super(key: key);

  @override
  State<LatestBlogDetailScreen> createState() => _LatestBlogDetailScreenState();
}

class _LatestBlogDetailScreenState extends State<LatestBlogDetailScreen> {
  List<LatestBlogModel> blogList = [];

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    blogList = DataFile.getAllLatestData(context);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantData.bgColor,
          body: SafeArea(
              child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 22,
                        color: ConstantData.shadowColor.withOpacity(0.20))
                  ], color: ConstantData.bgColor),
                  child: appBar(
                    () {
                      Get.back();
                    },
                    text: "blog",
                  ).paddingSymmetric(vertical: 16.h, horizontal: 20.h)),
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                  children: [
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "${ConstantData.assetsPath + widget.blog.image!}"),
                              fit: BoxFit.cover),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.h))),
                    ),
                    getVerSpace(16.h),
                    getCustomFont(widget.blog.title ?? "", 20.sp,
                        ConstantData.textColor, 1,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start),
                    getVerSpace(16.h),
                    getMultilineCustomFont(
                        "Per conubia nostra, pe himenaeos. interdum tellus elit sed risus. "
                            "maecenas eget condimentum velit, sit amet feugiat lectus. "
                            "class aptent taciti sociosqu ad litora torquent per conubia nostra, pe himenaeos."
                            "\n\nBorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "etiam eu turpis molestie, dictum est a, mattis tellus. "
                            "Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, "
                            "ut interdum tellus elit sed risus. maecenas eget"
                            "\n\nMaecenas eget condimentum velit, sit amet feugiat lectus. "
                            "class aptent taciti sociosqu ad litora torquent per conubia nostra,"
                            "\n\nBorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "etiam eu turpis molestie, dictum est a, mattis tellus. "
                            "Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, "
                            "ut interdum tellus elit sed risus."
                            "\n\nper conubia nostra, pe himenaeos. interdum tellus elit sed risus. "
                            "maecenas eget condimentum velit, sit amet feugiat lectus. "
                            "class aptent taciti sociosqu ad litora torquent per conubia nostra, pe himenaeos."
                            "\n\nBorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim,"
                            " metus nec fringilla accumsan, risus sem sollicitudin lacus, "
                            "ut interdum tellus elit sed risus. maecenas eget\n\n",
                        17.sp,
                        ConstantData.textColor,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            ],
          )),
        ),
        onWillPop: () async {
          Get.back();
          return false;
        });
  }
}
