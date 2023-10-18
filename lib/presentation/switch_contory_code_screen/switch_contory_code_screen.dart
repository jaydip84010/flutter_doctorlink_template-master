import 'controller/switch_contory_code_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SwitchContoryCodeScreen extends GetWidget<SwitchContoryCodeController> {
  const SwitchContoryCodeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.black90066,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorConstant.black90066,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSwitchcontorycode,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(
                    842,
                  ),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 37,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: getPadding(
                            left: 179,
                            top: 15,
                            right: 179,
                            bottom: 15,
                          ),
                          decoration: AppDecoration.white.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL32,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  bottom: 807,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    5,
                                  ),
                                  thickness: getVerticalSize(
                                    5,
                                  ),
                                  color: ColorConstant.gray300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: getPadding(
                            left: 16,
                            right: 16,
                            bottom: 10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturyController,
                                hintText: "msg_afghanistan_93".tr,
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturyoneController,
                                hintText: "lbl_australia_61".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturytwoController,
                                hintText: "lbl_kuwait_965".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturythreeController,
                                hintText: "lbl_uae_971".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturyfourController,
                                hintText: "lbl_usa_1".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                                padding: TextFormFieldPadding.PaddingT16,
                                fontStyle:
                                    TextFormFieldFontStyle.AvenirRegular18,
                                suffix: Container(
                                  margin: getMargin(
                                    left: 30,
                                    top: 16,
                                    right: 16,
                                    bottom: 16,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                  ),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                    60,
                                  ),
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturyfiveController,
                                hintText: "lbl_algeria_213".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturysixController,
                                hintText: "lbl_albania_355".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturysevenController,
                                hintText: "lbl_india_91".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturyeightController,
                                hintText: "lbl_austria_43".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturynineController,
                                hintText: "lbl_belarus_375".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.conturytenController,
                                hintText: "msg_afghanistan_93".tr,
                                margin: getMargin(
                                  top: 8,
                                ),
                                variant: TextFormFieldVariant.FillWhiteA700,
                                textInputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          76,
                        ),
                        width: double.maxFinite,
                        text: "lbl_select_country".tr,
                        variant: ButtonVariant.FillGray50,
                        shape: ButtonShape.CustomBorderTL24,
                        padding: ButtonPadding.PaddingAll22,
                        fontStyle: ButtonFontStyle.AvenirBlack20,
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
