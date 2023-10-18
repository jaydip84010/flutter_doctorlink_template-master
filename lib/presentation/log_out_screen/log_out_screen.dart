import '../home_screen_container_screen/controller/custum_bottom_bar_controller.dart';
import 'controller/log_out_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LogOutScreen extends GetWidget<LogOutController> {
  CustomBottomBarController customBottomBarController = Get.put(CustomBottomBarController());
   LogOutScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: getPadding(left: 30,top: 28,bottom: 28,right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Text(
                    "msg_are_you_sure_you".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtHeadline,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          height: getVerticalSize(
                            46,
                          ),

                          text: "lbl_cancel".tr,
                          margin: getMargin(
                            right: 10,
                          ),
                          onTap: (){
                            Get.back();
                          },
                          variant: ButtonVariant.OutlineCyan800,
                          padding: ButtonPadding.PaddingAll9,
                          fontStyle:
                          ButtonFontStyle.AvenirBlack18Cyan800,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          onTap: (){
                            PrefUtils.setIsSignIn(true);
                            customBottomBarController.getIndex(0);
                            Get.offAllNamed(AppRoutes.signInScreen);
                          },
                          height: getVerticalSize(
                            46,
                          ),
                          text: "lbl_log_out2".tr,
                          margin: getMargin(
                            left: 10,
                          ),
                          fontStyle: ButtonFontStyle.SFProDisplayBold18,
                        ),
                      ),
                    ],
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
