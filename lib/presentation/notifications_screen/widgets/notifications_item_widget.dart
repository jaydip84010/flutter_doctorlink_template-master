import '../controller/notifications_controller.dart';
import '../models/notifications_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsItemWidget extends StatelessWidget {
  NotificationsItemWidget(
    this.notificationsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationsItemModel notificationsItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray200,
      child: Padding(
        padding: getPadding(top: 8,bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomIconButton(
                  height: 44,
                  width: 44,
                  margin: getMargin(
                    top: 6,
                    bottom: 5,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcnotificationCyan800,
                  ),
                ),
                SizedBox(width: getHorizontalSize(16),),
                Container(
                  width: getSize(295),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        notificationsItemModelObj.title!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtHeadline,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child:Text(
                          notificationsItemModelObj.msg!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtFootnote,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              notificationsItemModelObj.time!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOutfitRegular14.copyWith(
                letterSpacing: getHorizontalSize(
                  0.14,
                ),
              ),
            ),
          ],
        ),
      ),
    );








  }
}
