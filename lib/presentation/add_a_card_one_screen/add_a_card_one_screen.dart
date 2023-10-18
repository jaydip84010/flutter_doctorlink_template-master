import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_floating_edit_text.dart';
import 'controller/add_a_card_one_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/core/utils/validation_functions.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';





class AddACardOneScreen extends StatefulWidget {
  const AddACardOneScreen({Key? key}) : super(key: key);

  @override
  State<AddACardOneScreen> createState() => _AddACardOneScreenState();
}

class _AddACardOneScreenState extends State<AddACardOneScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AddACardOneController controller = Get.put(AddACardOneController());
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
                          onTapArrowleft17();
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
                              children: [
                                Expanded(
                                  child: ListView(
                                      primary: false,
                                      shrinkWrap: true,
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(getHorizontalSize(24))
                                          ),
                                          child: CustomImageView(
                                            imagePath: ImageConstant.imgCreditCard,
                                          ),
                                        ),
                                        CustomFloatingEditText(
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
                                                          controller:
                                                          controller.expirydateoneController,
                                                          textInputType: TextInputType.number,
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
                                                          controller:
                                                          controller.cvvController,
                                                          textInputType: TextInputType.number,
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

                                      ]),
                                ),
                                CustomButton(
                                    onTap: (){
                                      Get.back();
                                    },
                                    alignment: Alignment.bottomCenter,
                                    height: getVerticalSize(54),
                                    text: "lbl_add_card".tr,
                                    margin: getMargin(bottom: 24))
                              ],
                            )))))));
  }

  onTapArrowleft17() {
    Get.back();
  }
}






