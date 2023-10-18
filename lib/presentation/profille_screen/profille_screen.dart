import '../log_out_screen/log_out_screen.dart';
import 'controller/profille_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProfilleScreen extends GetWidget<ProfilleController> {
  const ProfilleScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Container(
            padding: getPadding(
              left: 170,
              top: 14,
              right: 170,
              bottom: 14,
            ),
            decoration: AppDecoration.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(
                    bottom: 4,
                  ),
                  child: Text(
                    "lbl_profile".tr,
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
            padding: getPadding(
              left: 16,
              top: 40,
              right: 16,
              bottom: 0,
            ),
            decoration: AppDecoration.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse238,
                  height: getSize(
                    96,
                  ),
                  width: getSize(
                    96,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      48,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 13,
                  ),
                  child: Text(
                    "lbl_ronald_richards2".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtHeadline,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 5,
                  ),
                  child: Text(
                    "msg_ronaldrichards_gmail_com".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ),
                GestureDetector(
                  onTap: (){Get.toNamed(AppRoutes.profileDetailsScreen);},
                  child: Container(
                    margin: getMargin(
                      top: 15,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIcuserstokeBlack900,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 3,
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            bottom: 2,
                          ),
                          child: Text(
                            "lbl_profile".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            right: 1,
                            bottom: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Get.toNamed(AppRoutes.myCardsScreen);},
                  child: Container(
                    margin: getMargin(
                      top: 16,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIccardstoke,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 2,
                            bottom: 1,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            top: 1,
                          ),
                          child: Text(
                            "lbl_my_cards".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            right: 1,
                            bottom: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Get.toNamed(AppRoutes.notificationsScreen);},
                  child: Container(
                    margin: getMargin(
                      top: 16,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIcnotificationBlack900,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 3,
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            bottom: 2,
                          ),
                          child: Text(
                            "lbl_notification".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            right: 1,
                            bottom: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Get.toNamed(AppRoutes.privacyPolicyScreen);},
                  child: Container(
                    margin: getMargin(
                      top: 16,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIcprivacypolicy,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 2,
                            bottom: 1,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            top: 1,
                          ),
                          child: Text(
                            "lbl_privacy_policy".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            right: 1,
                            bottom: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.zero,
                          content: LogOutScreen(),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: getMargin(
                      top: 16,
                      bottom: 90,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIclogout,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 3,
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            top: 2,
                          ),
                          child: Text(
                            "lbl_log_out".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            right: 1,
                            bottom: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
