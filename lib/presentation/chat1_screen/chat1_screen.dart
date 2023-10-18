import '../chat1_screen/widgets/chat_item_widget.dart';
import 'controller/chat1_controller.dart';
import 'models/chat_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Chat1Screen extends GetWidget<Chat1Controller> {
  const Chat1Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    left: 189,
                    top: 15,
                    right: 189,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(
                          bottom: 3,
                        ),
                        child: Text(
                          "lbl_call".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtAvenirBlack28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 8,
                  ),
                  decoration: AppDecoration.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          36,
                        ),
                        width: double.maxFinite,
                        margin: getMargin(
                          top: 19,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
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
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_call".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtHeadlineCyan800,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 6,
                                    ),
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
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_chat".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtHeadline,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 6,
                                    ),
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
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: getPadding(
                            left: 16,
                            top: 16,
                            right: 16,
                          ),
                          child: Obx(
                            () => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    16,
                                  ),
                                );
                              },
                              itemCount: controller.chat1ModelObj.value
                                  .chatItemList.value.length,
                              itemBuilder: (context, index) {
                                ChatItemModel model = controller.chat1ModelObj
                                    .value.chatItemList.value[index];
                                return ChatItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          height: 40,
          width: 40,
          child: CustomImageView(
            svgPath: ImageConstant.imgIcvideostokeBlack900,
            height: getVerticalSize(
              20.0,
            ),
            width: getHorizontalSize(
              20.0,
            ),
          ),
        ),
      ),
    );
  }
}
