import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/edit_profile_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/core/utils/validation_functions.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_floating_edit_text.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';





class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = Get.put(EditProfileController());
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
    controller.nameController.text = "Ronald Richards";
    controller.emailController.text = "ronaldrichards@gmail.com";
    controller.phoneNumberController.text = "(219)555-0114";
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
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
                          onTapArrowleft16();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_edit_profile".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Form(
                    key: _formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Container(
                            width: double.maxFinite,
                            margin: getMargin(top: 8),
                            padding: getPadding(
                                left: 16, top: 40, right: 16, bottom: 40),
                            decoration: AppDecoration.white.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: getSize(110),
                                      width: getSize(110),
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                ImageConstant.imgEllipse240,
                                                height: getSize(110),
                                                width: getSize(110),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(55)),
                                                alignment: Alignment.center),
                                            CustomIconButton(
                                                height: 28,
                                                width: 28,
                                                margin: getMargin(bottom: 4),
                                                variant: IconButtonVariant
                                                    .OutlineBlack9000f,
                                                shape:
                                                IconButtonShape.CircleBorder14,
                                                alignment: Alignment.bottomRight,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgEditBlack900))
                                          ])),

                                  CustomFloatingEditText(
                                      controller: controller.nameController,
                                      labelText: "lbl_name".tr,
                                      hintText: "lbl_ronaldrichards2".tr,
                                      variant:
                                      FloatingEditTextVariant.OutlineRed700,
                                      shape: FloatingEditTextShape.RoundedBorder8,
                                      padding: FloatingEditTextPadding.PaddingTB15,
                                      margin: getMargin(top: 38),
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid text";
                                        }
                                        return null;
                                      }),


                                  // CustomFloatingEditText(
                                  //     focusNode: FocusNode(),
                                  //     autofocus: true,
                                  //     controller: controller.nameController,
                                  //     labelText: "lbl_name".tr,
                                  //     hintText: "lbl_ronaldrichards2".tr,
                                  //     margin: getMargin(top: 38),
                                  //     validator: (value) {
                                  //       if (!isText(value)) {
                                  //         return "Please enter valid text";
                                  //       }
                                  //       return null;
                                  //     }),
                                  CustomFloatingEditText(
                                      controller: controller.emailController,
                                      labelText: "lbl_email_address".tr,
                                      hintText: "msg_ronaldrichards_gmail_com".tr,
                                      variant:
                                      FloatingEditTextVariant.OutlineRed700,
                                      shape: FloatingEditTextShape.RoundedBorder8,
                                      padding: FloatingEditTextPadding.PaddingTB15,
                                      margin: getMargin(top: 24),
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid text";
                                        }
                                        return null;
                                      }),
                                  // CustomFloatingEditText(
                                  //     controller: controller.emailController,
                                  //     labelText: "lbl_email_address".tr,
                                  //     hintText: "msg_ronaldrichards_gmail_com".tr,
                                  //     margin: getMargin(top: 24),
                                  //     textInputType: TextInputType.emailAddress,
                                  //     validator: (value) {
                                  //       if (value == null ||
                                  //           (!isValidEmail(value,
                                  //               isRequired: true))) {
                                  //         return "Please enter valid email";
                                  //       }
                                  //       return null;
                                  //     }),
                                  SizedBox(height: getVerticalSize(24),),

                                  phone_number_field(
                                      controller.phoneNumberController, (p0) {
                                    if (p0 == null || p0.number.isEmpty) {
                                      return "Enter valid number";
                                    }
                                    return null;
                                  }),
                                  Spacer(),
                                  CustomButton(
                                      onTap: (){
                                        Get.back();
                                      },
                                      height: getVerticalSize(54),
                                      text: "lbl_save".tr)
                                ])))))));
  }
  onTapArrowleft16() {
    Get.back();
  }
}






