import 'controller/add_a_card_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/core/utils/validation_functions.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AddACardScreen extends GetWidget<AddACardController> {
  AddACardScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      onTapArrowleft18();
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_add_card".tr),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        width: double.maxFinite,
                        margin: getMargin(top: 10),
                        padding: getPadding(all: 16),
                        decoration: AppDecoration.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.black900,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder25),
                                  child: Container(
                                      height: getVerticalSize(241),
                                      width: getHorizontalSize(396),
                                      decoration: AppDecoration.black.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder25),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    decoration: AppDecoration
                                                        .gradientDeeppurple90087Black90087
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder25),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgGroup167x251,
                                                              height:
                                                                  getVerticalSize(
                                                                      167),
                                                              width:
                                                                  getHorizontalSize(
                                                                      251),
                                                              margin: getMargin(
                                                                  top: 73))
                                                        ]))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Card(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: EdgeInsets.all(0),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .circleBorder25),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            241),
                                                        width:
                                                            getHorizontalSize(
                                                                396),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder25),
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgNoise,
                                                                  height:
                                                                      getVerticalSize(
                                                                          241),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          396),
                                                                  alignment:
                                                                      Alignment
                                                                          .center),
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  24,
                                                                              right:
                                                                                  24),
                                                                          child: Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                    padding: getPadding(left: 3),
                                                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                      CustomImageView(svgPath: ImageConstant.imgMap, height: getVerticalSize(26), width: getHorizontalSize(38), margin: getMargin(top: 7, bottom: 7)),
                                                                                      CustomImageView(svgPath: ImageConstant.imgMastercard, height: getSize(40), width: getSize(40))
                                                                                    ])),
                                                                                Container(margin: getMargin(top: 71), decoration: AppDecoration.txtOutlineBlack9003f, child: Text("msg_1234".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtOCRAExtended24)),
                                                                                Padding(
                                                                                    padding: getPadding(top: 15),
                                                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                      Text("lbl_cardholder_name".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtIBMPlexSansMedium10),
                                                                                      Text("lbl_expiry_date".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtIBMPlexSansMedium10)
                                                                                    ])),
                                                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                  Text("lbl_ronald_richards".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtIBMPlexSansBold18),
                                                                                  Container(margin: getMargin(bottom: 4), decoration: AppDecoration.txtOutlineBlack9003f, child: Text("lbl_06_26".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.right, style: AppStyle.txtOCRAExtended18))
                                                                                ])
                                                                              ])))
                                                            ]))))
                                          ]))),
                              CustomFloatingEditText(
                                  focusNode: FocusNode(),
                                  autofocus: true,
                                  controller: controller.nameController,
                                  labelText: "msg_card_holder_name".tr,
                                  hintText: "lbl_ronald_richards".tr,
                                  margin: getMargin(top: 22),
                                  validator: (value) {
                                    if (!isText(value)) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  }),
                              CustomFloatingEditText(
                                  focusNode: FocusNode(),
                                  autofocus: true,
                                  controller: controller.cardnumberController,
                                  labelText: "lbl_card_number".tr,
                                  hintText: "msg_3011_2051_6859_1234".tr,
                                  margin: getMargin(top: 14),
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (!isNumeric(value)) {
                                      return "Please enter valid number";
                                    }
                                    return null;
                                  }),
                              Padding(
                                  padding: getPadding(top: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomFloatingEditText(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller:
                                                    controller.dateController,
                                                labelText: "lbl_exp_date".tr,
                                                hintText: "lbl_06_26".tr,
                                                margin: getMargin(right: 8),
                                                variant: FloatingEditTextVariant
                                                    .OutlineGray300,
                                                shape: FloatingEditTextShape
                                                    .RoundedBorder8,
                                                padding: FloatingEditTextPadding
                                                    .PaddingTB15)),
                                        Expanded(
                                            child: CustomFloatingEditText(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller:
                                                    controller.cvvController,
                                                labelText: "lbl_cvv2".tr,
                                                hintText: "lbl_123".tr,
                                                margin: getMargin(left: 8),
                                                variant: FloatingEditTextVariant
                                                    .OutlineGray300,
                                                shape: FloatingEditTextShape
                                                    .RoundedBorder8,
                                                padding: FloatingEditTextPadding
                                                    .PaddingTB15,
                                                textInputAction:
                                                    TextInputAction.done))
                                      ])),
                              Spacer(),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_add_card".tr,
                                  margin: getMargin(bottom: 24))
                            ]))))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft18() {
    Get.back();
  }
}
