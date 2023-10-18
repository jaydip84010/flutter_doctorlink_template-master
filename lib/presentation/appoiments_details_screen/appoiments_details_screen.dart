import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/appoiments_details_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class AppoimentsDetailsScreen extends StatefulWidget {
  const AppoimentsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AppoimentsDetailsScreen> createState() =>
      _AppoimentsDetailsScreenState();
}

class _AppoimentsDetailsScreenState extends State<AppoimentsDetailsScreen> {
  AppoimentsDetailsController appoimentsDetailsController =
      Get.put(AppoimentsDetailsController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                backgroundColor: ColorConstant.gray50,
                appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          onTapArrowleft14();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "msg_appointments_details".tr),
                    styleType: Style.bgFillWhiteA700),
                body: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        width: double.maxFinite,
                        margin: getMargin(top: 8),
                        padding: getPadding(top: 16, bottom: 16),
                        decoration: AppDecoration.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      margin: getMargin(left: 16, right: 16),
                                      padding: getPadding(all: 8),
                                      decoration: AppDecoration.fillGray50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle440635,
                                                height: getVerticalSize(82),
                                                width: getHorizontalSize(84),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(8))),
                                            Padding(
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 9,
                                                    bottom: 12),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          "msg_dr_ronald_richards"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtHeadline),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Text(
                                                              "lbl_orthopedic"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtBody))
                                                    ])),
                                            Spacer(),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgIcStarFill,
                                                height: getSize(20),
                                                width: getSize(20),
                                                margin: getMargin(
                                                    top: 53, bottom: 9)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 6,
                                                    top: 49,
                                                    right: 8,
                                                    bottom: 7),
                                                child: Text("lbl_5_0".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtBody))
                                          ]))),
                              Container(
                                  width: double.maxFinite,
                                  margin: getMargin(top: 16),
                                  padding: getPadding(top: 16, bottom: 16,left: 16,right: 16),
                                  decoration: AppDecoration.white.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                                margin: getMargin(right: 8),
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 14,
                                                    right: 16,
                                                    bottom: 14),
                                                decoration: AppDecoration
                                                    .fillGray50
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomIconButton(
                                                          height: 46,
                                                          width: 46,
                                                          margin: getMargin(
                                                              top: 7,
                                                              bottom: 7),
                                                          variant:
                                                              IconButtonVariant
                                                                  .FillTeal40063,
                                                          shape: IconButtonShape
                                                              .CircleBorder23,
                                                          child: CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgIcusergroupstoke)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              bottom: 2),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_5000"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtBody),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                8),
                                                                    child: Text(
                                                                        "lbl_patients"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtBody))
                                                              ]))
                                                    ]))),
                                        Expanded(
                                            child: Container(
                                                margin: getMargin(left: 8),
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 14,
                                                    right: 16,
                                                    bottom: 14),
                                                decoration: AppDecoration
                                                    .fillGray50
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(children: [
                                                  CustomIconButton(
                                                      height: 46,
                                                      width: 46,
                                                      margin: getMargin(
                                                          top: 7, bottom: 7),
                                                      variant: IconButtonVariant
                                                          .FillTeal40063,
                                                      shape: IconButtonShape
                                                          .CircleBorder23,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgIcuserstoke)),
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 16),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "lbl_15_years"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtBody),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 9),
                                                                child: Text(
                                                                    "lbl_experiences"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtBody))
                                                          ]))
                                                ])))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 16, top: 15),
                                  child: Text("msg_scheduled_appointment".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtHeadline)),
                              Padding(
                                  padding: getPadding(left: 16, top: 15),
                                  child: Text("msg_today_december".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirRegular14)),
                              Padding(
                                  padding: getPadding(left: 16, top: 3),
                                  child: Text("msg_16_00_16_30_pm_30".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirRegular14)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Divider(
                                          height: getVerticalSize(1),
                                          thickness: getVerticalSize(1),
                                          color: ColorConstant.gray300,
                                          indent: getHorizontalSize(16),
                                          endIndent: getHorizontalSize(16)))),
                              Padding(
                                  padding: getPadding(left: 16, top: 13),
                                  child: Text("msg_patient_information".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtHeadline)),
                              Padding(
                                  padding: getPadding(left: 15, top: 16),
                                  child: Text("msg_full_name_ronald".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirRegular14)),
                              Padding(
                                  padding: getPadding(left: 15, top: 4),
                                  child: Text("lbl_gender_male".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirRegular14)),
                              Padding(
                                  padding: getPadding(left: 15, top: 5),
                                  child: Text("lbl_age_27".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirRegular14)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(top: 15),
                                      child: Divider(
                                          height: getVerticalSize(1),
                                          thickness: getVerticalSize(1),
                                          color: ColorConstant.gray300,
                                          indent: getHorizontalSize(17),
                                          endIndent: getHorizontalSize(15)))),
                              Padding(
                                  padding: getPadding(left: 16, top: 15),
                                  child: Text("lbl_your_package".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtHeadline)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      margin: getMargin(
                                          left: 16,
                                          top: 15,
                                          right: 16,
                                          bottom: 5),
                                      padding: getPadding(
                                          left: 16,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      decoration: AppDecoration.fillGray50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 1),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("lbl_massaging".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtHeadline),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 2),
                                                          child: Text(
                                                              "msg_chat_massage_with"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ])),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_25_00".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtAvenirHeavy16),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 8),
                                                      child: Text(
                                                          "lbl_30_mins".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600))
                                                ])
                                          ])))
                            ]))))));
  }

  onTapArrowleft14() {
    Get.back();
  }
}
