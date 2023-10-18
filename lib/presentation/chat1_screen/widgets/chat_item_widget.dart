import '../controller/chat1_controller.dart';
import '../models/chat_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatItemWidget extends StatelessWidget {
  ChatItemWidget(
    this.chatItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChatItemModel chatItemModelObj;

  var controller = Get.find<Chat1Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 13,
        top: 15,
        right: 13,
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
                  bottom: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        chatItemModelObj.nameTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtHeadline,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Text(
                        "msg_outgoing_dec_20".tr,
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
          CustomIconButton(
            height: 40,
            width: 40,
            margin: getMargin(
              top: 9,
              right: 3,
              bottom: 9,
            ),
            variant: IconButtonVariant.OutlineBlack9000f_1,
            child: CustomImageView(
              svgPath: ImageConstant.imgIcvideostokeBlack900,
            ),
          ),
        ],
      ),
    );
  }
}
