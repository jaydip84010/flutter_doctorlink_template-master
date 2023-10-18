import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/chat_details_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  ChatDetailsController chatDetailsController =
      Get.put(ChatDetailsController());

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
                backgroundColor: ColorConstant.whiteA700,
                body: Padding(
                  padding: getPadding(bottom: 40),
                  child: Stack(
                    children: [
                      Padding(
                        padding: getPadding(right: 16, left: 16, top: 16),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgArrowleft,
                                            height: getSize(20),
                                            width: getSize(20),
                                            alignment: Alignment.topLeft,
                                            margin: getMargin(left: 4, top: 0),
                                            onTap: () {
                                              onTapImgArrowleft();
                                            }),
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse2350x50,
                                            height: getSize(50),
                                            width: getSize(50),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(25)),
                                            margin: getMargin(left: 16)),
                                        SizedBox(
                                          width: getHorizontalSize(16),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("msg_dr_jenny_wilson3".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFProTextBold20),
                                              Padding(
                                                  padding: getPadding(top: 6),
                                                  child: Text(
                                                      "msg_active_6_hour_ago".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFProTextRegular13))
                                            ]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomImageView(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.videoCallScreen);
                                            },
                                            svgPath: ImageConstant
                                                .imgVideocameraBlack900,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin: getMargin(
                                                left: 0, top: 0, bottom: 0)),
                                        SizedBox(
                                          width: getHorizontalSize(24),
                                        ),
                                        CustomImageView(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.callMeetingScreen);
                                            },
                                            svgPath: ImageConstant.imgCall,
                                            height: getSize(24),
                                            width: getSize(24),
                                            alignment: Alignment.topRight,
                                            margin: getMargin(top: 0))
                                      ],
                                    )
                                  ]),
                              Expanded(
                                child: ListView(
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 36),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 3),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text("lbl_you".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFProTextRegular13),
                                                        Container(
                                                            width:
                                                            getHorizontalSize(200),
                                                            margin: getMargin(top: 7),
                                                            padding: getPadding(
                                                                left: 16,
                                                                top: 4,
                                                                right: 16,
                                                                bottom: 4),
                                                            decoration: AppDecoration
                                                                .fillBlue50
                                                                .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .customBorderTL16),
                                                            child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize.min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                      width:
                                                                      getHorizontalSize(
                                                                          160),
                                                                      child: Text(
                                                                          "msg_hi_good_afternoon"
                                                                              .tr,
                                                                          maxLines:
                                                                          null,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                          style: AppStyle
                                                                              .txtBody))
                                                                ])),
                                                        Padding(
                                                            padding: getPadding(top: 8),
                                                            child: Text(
                                                                "lbl_09_55_am".tr,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: AppStyle
                                                                    .txtSFProTextRegular13))
                                                      ])),
                                              CustomImageView(
                                                  imagePath: ImageConstant.imgEllipse24,
                                                  height: getSize(50),
                                                  width: getSize(50),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(25)),
                                                  margin:
                                                  getMargin(left: 7, bottom: 55))
                                            ])),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(top: 15, right: 111),
                                            child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgEllipse2450x50,
                                                      height: getSize(50),
                                                      width: getSize(50),
                                                      radius: BorderRadius.circular(
                                                          getHorizontalSize(25)),
                                                      margin: getMargin(bottom: 55)),
                                                  Expanded(
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 8, top: 4),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                    "msg_dr_jenny_wilson"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign.left,
                                                                    style: AppStyle
                                                                        .txtSFProTextRegular13),
                                                                Container(
                                                                    margin: getMargin(
                                                                        top: 6),
                                                                    padding: getPadding(
                                                                        left: 16,
                                                                        top: 7,
                                                                        right: 16,
                                                                        bottom: 7),
                                                                    decoration: AppDecoration
                                                                        .fillGray50
                                                                        .copyWith(
                                                                        borderRadius:
                                                                        BorderRadiusStyle
                                                                            .customBorderTL16),
                                                                    child: Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                        children: [
                                                                          SizedBox(
                                                                              width: getHorizontalSize(
                                                                                  194),
                                                                              child: Text(
                                                                                  "msg_hello_good_afternoon"
                                                                                      .tr,
                                                                                  maxLines:
                                                                                  null,
                                                                                  textAlign: TextAlign
                                                                                      .left,
                                                                                  style:
                                                                                  AppStyle.txtSFProTextRegular16Black900))
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 8),
                                                                    child: Text(
                                                                        "lbl_09_55_am"
                                                                            .tr,
                                                                        overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                        style: AppStyle
                                                                            .txtSFProTextRegular13))
                                                              ])))
                                                ]))),
                                    Padding(
                                        padding: getPadding(left: 98, top: 15),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                      padding: getPadding(top: 3),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Text("lbl_you".tr,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: AppStyle
                                                                    .txtSFProTextRegular13),
                                                            Container(
                                                                margin:
                                                                getMargin(top: 7),
                                                                padding: getPadding(
                                                                    left: 16,
                                                                    top: 4,
                                                                    right: 16,
                                                                    bottom: 4),
                                                                decoration: AppDecoration
                                                                    .fillBlue50
                                                                    .copyWith(
                                                                    borderRadius:
                                                                    BorderRadiusStyle
                                                                        .customBorderTL16),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Container(
                                                                          width:
                                                                          getHorizontalSize(
                                                                              205),
                                                                          margin:
                                                                          getMargin(
                                                                              right:
                                                                              1),
                                                                          child: Text(
                                                                              "msg_i_m_ronald_i_have"
                                                                                  .tr,
                                                                              maxLines:
                                                                              null,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: AppStyle
                                                                                  .txtBody))
                                                                    ])),
                                                            Padding(
                                                                padding: getPadding(
                                                                    top: 8, right: 4),
                                                                child: Text(
                                                                    "lbl_09_55_am".tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign.left,
                                                                    style: AppStyle
                                                                        .txtSFProTextRegular13))
                                                          ]))),
                                              CustomImageView(
                                                  imagePath: ImageConstant.imgEllipse24,
                                                  height: getSize(50),
                                                  width: getSize(50),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(25)),
                                                  margin:
                                                  getMargin(left: 7, bottom: 55))
                                            ])),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(top: 15),
                                            child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgEllipse2450x50,
                                                      height: getSize(50),
                                                      width: getSize(50),
                                                      radius: BorderRadius.circular(
                                                          getHorizontalSize(25)),
                                                      margin: getMargin(bottom: 55)),
                                                  Padding(
                                                      padding:
                                                      getPadding(left: 8, top: 4),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                "msg_dr_jenny_wilson"
                                                                    .tr,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: AppStyle
                                                                    .txtSFProTextRegular13),
                                                            Container(
                                                                margin:
                                                                getMargin(top: 6),
                                                                padding: getPadding(
                                                                    left: 16,
                                                                    top: 4,
                                                                    right: 16,
                                                                    bottom: 4),
                                                                decoration: AppDecoration
                                                                    .fillGray50
                                                                    .copyWith(
                                                                    borderRadius:
                                                                    BorderRadiusStyle
                                                                        .customBorderTL16),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                          getHorizontalSize(
                                                                              178),
                                                                          child: Text(
                                                                              "msg_can_you_tell_me"
                                                                                  .tr,
                                                                              maxLines:
                                                                              null,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: AppStyle
                                                                                  .txtBody))
                                                                    ])),
                                                            Padding(
                                                                padding: getPadding(
                                                                    left: 2, top: 8),
                                                                child: Text(
                                                                    "lbl_09_55_am".tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign.left,
                                                                    style: AppStyle
                                                                        .txtSFProTextRegular13))
                                                          ]))
                                                ])))
                                  ],
                                ),
                              )
                            ]),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: getPadding(left: 16, right: 16, bottom: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    controller: chatDetailsController
                                        .grouptwentyfourController,
                                    hintText: "lbl_massage".tr,
                                    variant: TextFormFieldVariant.FillGray50,
                                    shape: TextFormFieldShape.RoundedBorder16,
                                    fontStyle: TextFormFieldFontStyle
                                        .SFProTextRegular16,
                                    textInputAction: TextInputAction.done),
                              ),
                              SizedBox(
                                width: getHorizontalSize(16),
                              ),
                              Container(
                                height: getSize(58),
                                width: getSize(58),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstant.cyan800),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgIcsendfill,
                                  height: getVerticalSize(29.0),
                                  width: getHorizontalSize(29.0),
                                  margin: getMargin(all: 11.28),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
