import 'call_tab.dart';
import 'chat_tab.dart';
import 'controller/chat_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/chat_model.dart';
import 'models/model_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = Get.put(ChatController());
  PageController pageController = PageController();
  List<ChatModel> chat = ModelData.getChatData();
List tabs = [ChatTab(),CallTab()];
  @override
  Widget build(BuildContext context) {
    return chat.isEmpty?SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Container(
              padding: getPadding(
                left: 182,
                top: 15,
                right: 182,
                bottom: 15,
              ),
              decoration: AppDecoration.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_chat".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAvenirBlack28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            svgPath: ImageConstant.imgCardBlue50,
            height: getSize(
              140,
            ),
            width: getSize(
              140,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 27,
            ),
            child: Text(
              "lbl_no_chat_yet".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtAvenirBlack28,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 10,
              bottom: 243,
            ),
            child: Text(
              "msg_it_is_a_long_established".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtBody,
            ),
          ),
        ],
      ),
    ):GetBuilder<ChatController>(
      init: ChatController(),
      builder:(controller) =>  SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Container(
                padding: getPadding(
                  left: 182,
                  top: 15,
                  right: 182,
                  bottom: 15,
                ),
                decoration: AppDecoration.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_chat".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtAvenirBlack28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: getMargin(
                  top: 8,
                  bottom: 8,
                ),
                decoration: AppDecoration.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 0,
                        top: 19,
                        right: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {

                                controller.currentPage==1?pageController.previousPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn):SizedBox();
                                controller.setCurrentPage(0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: controller.currentPage==0?ColorConstant.cyan800:ColorConstant.gray200))),
                                child: Padding(
                                  padding: getPadding(bottom: 5),
                                  child: Center(
                                    child: Text(
                                      "lbl_chat".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: controller.currentPage==0?AppStyle.txtHeadlineCyan800:AppStyle.txtHeadline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {

                                controller.currentPage==0?pageController.nextPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn):SizedBox();
                                controller.setCurrentPage(1);

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: controller.currentPage==1?ColorConstant.cyan800:ColorConstant.gray200))),
                                child: Padding(
                                  padding: getPadding(bottom: 5),
                                  child: Center(
                                    child: Text(
                                      "lbl_call".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: controller.currentPage==1?AppStyle.txtHeadlineCyan800:AppStyle.txtHeadline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: PageView.builder(
                          itemCount: 2,
                          onPageChanged: (value) {
                            controller.setCurrentPage(value);
                          },
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return tabs[index];
                          },
                        ),
                      ),
                    )

                    /*  Container(
                        height: getVerticalSize(
                          1,
                        ),
                        width: double.maxFinite,
                        margin: getMargin(
                          top: 6,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: ColorConstant.gray200,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: getHorizontalSize(
                                  214,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: ColorConstant.cyan800,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: getHorizontalSize(
                                  214,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: ColorConstant.gray200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 15,
                          right: 16,
                          bottom: 15,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse22,
                                  height: getSize(
                                    58,
                                  ),
                                  width: getSize(
                                    58,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      29,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 16,
                                    bottom: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "msg_dr_jenny_wilson3".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 2,
                                        ),
                                        child: Text(
                                          "lbl_awesome".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtFootnoteGray600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: getPadding(
                                top: 31,
                                bottom: 1,
                              ),
                              child: Text(
                                "lbl_22_00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 2,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse2258x58,
                                    height: getSize(
                                      58,
                                    ),
                                    width: getSize(
                                      58,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        29,
                                      ),
                                    ),
                                    margin: getMargin(
                                      top: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "msg_dr_theresa_webb".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtHeadline,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 4,
                                          ),
                                          child: Text(
                                            "lbl_awesome".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtFootnoteGray600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 34,
                                bottom: 3,
                              ),
                              child: Text(
                                "lbl_22_00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 2,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse221,
                                    height: getSize(
                                      58,
                                    ),
                                    width: getSize(
                                      58,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        29,
                                      ),
                                    ),
                                    margin: getMargin(
                                      top: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "msg_dr_darrell_steward".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtHeadline,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 4,
                                          ),
                                          child: Text(
                                            "lbl_awesome".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtFootnoteGray600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 3,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(
                                      25,
                                    ),
                                    width: getHorizontalSize(
                                      24,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: getSize(
                                              24,
                                            ),
                                            width: getSize(
                                              24,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.cyan800,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 8,
                                            ),
                                            child: Text(
                                              "lbl_12".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtBodyWhiteA700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 7,
                                    ),
                                    child: Text(
                                      "lbl_22_00".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBodyGray600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 2,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse222,
                                    height: getSize(
                                      58,
                                    ),
                                    width: getSize(
                                      58,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        29,
                                      ),
                                    ),
                                    margin: getMargin(
                                      top: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "msg_dr_charolette_hanlin".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtHeadline,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 4,
                                          ),
                                          child: Text(
                                            "lbl_awesome".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtFootnoteGray600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 33,
                                bottom: 3,
                              ),
                              child: Text(
                                "lbl_22_00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 14,
                          right: 16,
                          bottom: 14,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 1,
                                bottom: 1,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse223,
                                    height: getSize(
                                      58,
                                    ),
                                    width: getSize(
                                      58,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        29,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "msg_dr_arlene_mccoy".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtHeadline,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 2,
                                          ),
                                          child: Text(
                                            "lbl_awesome".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtFootnoteGray600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(
                                      25,
                                    ),
                                    width: getHorizontalSize(
                                      24,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: getSize(
                                              24,
                                            ),
                                            width: getSize(
                                              24,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.cyan800,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 8,
                                            ),
                                            child: Text(
                                              "lbl_12".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtBodyWhiteA700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 7,
                                    ),
                                    child: Text(
                                      "lbl_22_00".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBodyGray600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse224,
                                  height: getSize(
                                    58,
                                  ),
                                  width: getSize(
                                    58,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      29,
                                    ),
                                  ),
                                  margin: getMargin(
                                    top: 2,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 16,
                                    bottom: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "msg_dr_chieko_chute".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 4,
                                        ),
                                        child: Text(
                                          "lbl_awesome".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtFootnoteGray600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: getPadding(
                                top: 34,
                                bottom: 1,
                              ),
                              child: Text(
                                "lbl_22_00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600,
                              ),
                            ),
                          ],
                        ),
                      ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
