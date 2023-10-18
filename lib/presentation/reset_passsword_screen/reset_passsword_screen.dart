import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/reset_passsword_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

class ResetPassswordScreen extends StatefulWidget {
  const ResetPassswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassswordScreen> createState() => _ResetPassswordScreenState();
}

class _ResetPassswordScreenState extends State<ResetPassswordScreen> {
  ResetPassswordController controller = Get.put(ResetPassswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          onTapArrowleft3();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_reset_password".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding:
                            getPadding(left: 16, top: 9, right: 16, bottom: 9),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(338),
                                  margin: getMargin(left: 26, right: 30),
                                  child: Text("msg_please_provide_the".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtBody)),
                              Obx(() => CustomFloatingEditText(
                                 width: double.infinity,
                                  controller: controller.newpasswordController,
                                  labelText: "lbl_new_password".tr,
                                  hintText: "lbl_new_password".tr,
                                  margin: getMargin(top: 27),
                                  padding: FloatingEditTextPadding.PaddingTB23,
                                  fontStyle:
                                      FloatingEditTextFontStyle.AvenirRegular15,
                                  textInputType: TextInputType.visiblePassword,
                                  isObscureText:
                                      controller.isShowPassword.value,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                          margin:
                                              getMargin(left: 16, right: 16),
                                          child: CustomImageView(
                                              svgPath: controller
                                                      .isShowPassword.value
                                                  ? ImageConstant
                                                      .imgIcPasswordStoke
                                                  : ImageConstant
                                                      .imgIcPasswordStoke))),
                                  suffixConstraints: BoxConstraints(
                                    minHeight: getVerticalSize(54),
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  })),
                              Obx(() => CustomFloatingEditText(
                                  controller:
                                      controller.confirmpasswordController,
                                  labelText: "msg_confirm_password".tr,
                                  hintText: "msg_confirm_password".tr,
                                  margin: getMargin(top: 28),
                                  padding: FloatingEditTextPadding.PaddingTB23,
                                  fontStyle:
                                      FloatingEditTextFontStyle.AvenirRegular15,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  isObscureText:
                                      controller.isShowPassword1.value,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword1.value =
                                            !controller.isShowPassword1.value;
                                      },
                                      child: Container(
                                          margin:
                                              getMargin(left: 16, right: 16),
                                          child: CustomImageView(
                                              svgPath: controller
                                                      .isShowPassword1.value
                                                  ? ImageConstant
                                                      .imgIcPasswordStoke
                                                  : ImageConstant
                                                      .imgIcPasswordStoke))),
                                  suffixConstraints: BoxConstraints(
                                    minHeight: getVerticalSize(54),
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  })),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_reset_password".tr,
                                  margin: getMargin(top: 30, bottom: 5),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      onTapResetpassword();
                                    }
                                  })
                            ]))))));
  }

  onTapResetpassword() {
    Get.toNamed(
      AppRoutes.resetPassswordSuccessScreen,
    );
  }

  onTapArrowleft3() {
    Get.back();
  }
}
