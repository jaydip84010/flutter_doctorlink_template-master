import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:pinput/pinput.dart';

import 'controller/verification_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
 VerificationController controller  = Get.put(VerificationController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 @override
 void initState() {
  SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(
       statusBarColor:ColorConstant.whiteA700,
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
                       onTapArrowleft1();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_verification".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 16, top: 9, right: 16, bottom: 9),
                  child: Form(
                    key: _formKey,
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
                         Padding(
                             padding: getPadding(top: 29),
                             child: RichText(
                                 text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_code_sent_to".tr,
                                      style: TextStyle(
                                          color: ColorConstant.fromHex("#000000"),
                                          fontSize: getFontSize(16),
                                          fontFamily: 'RobotoCondensed',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: "msg_ronaldrichards_gmail_com".tr,
                                      style: TextStyle(
                                          color: ColorConstant.fromHex("#000000"),
                                          fontSize: getFontSize(16),
                                          fontFamily: 'RobotoCondensed',
                                          fontWeight: FontWeight.w900))
                                 ]),
                                 textAlign: TextAlign.left)),
                         







                         Padding(
                             padding: getPadding(left: 3, top: 29, right: 3),
                             child: Obx(() =>

                                 Pinput(

                                   errorTextStyle:  TextStyle(
                                     color:ColorConstant.red,
                                     fontSize: getFontSize(
                                       16,
                                     ),
                                     fontFamily: 'RobotoCondensed',
                                     fontWeight: FontWeight.w400,
                                   ),
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   disabledPinTheme: PinTheme(
                                       padding: getPadding(left: 9,right: 9),
                                       decoration: BoxDecoration(color: Colors.red)
                                   ),
                                   controller: controller.otpController.value,
                                   length: 6,
                                   validator: (value) {
                                     if (value == null || value.isEmpty) {
                                       return "Please enter valid OTP";
                                     }
                                     return null;
                                   },
                                   errorPinTheme: PinTheme(
                                     padding: getPadding(left: 9,right: 9),
                                     decoration: BoxDecoration(
                                       color:ColorConstant.gray5001,
                                       border: Border.all(color:ColorConstant.red ),
                                       borderRadius:  BorderRadius.circular(
                                         getHorizontalSize(8),),

                                     ),
                                     textStyle: TextStyle(
                                       color:ColorConstant.red,
                                       fontSize: getFontSize(
                                         16,
                                       ),
                                       fontFamily: 'RobotoCondensed',
                                       fontWeight: FontWeight.w400,
                                     ),
                                     width: getHorizontalSize(51),
                                     height: getVerticalSize(51),
                                   ),
                                   defaultPinTheme: PinTheme(
                                     padding: getPadding(left: 9,right: 9),
                                     width: getHorizontalSize(51),
                                     height: getVerticalSize(51),
                                     textStyle:TextStyle(
                                       color: ColorConstant.black900,
                                       fontSize: getFontSize(
                                         24,
                                       ),
                                       fontFamily: 'RobotoCondensed',
                                       fontWeight: FontWeight.w400,
                                     ),
                                     decoration: BoxDecoration(
                                       color:ColorConstant.whiteA700,
                                       border: Border.all(color:ColorConstant.gray300 ),
                                       borderRadius:  BorderRadius.circular(
                                         getHorizontalSize(8),),

                                     ),
                                   ),
                                 ),)),
                         CustomButton(
                           onTap: (){
                             if(_formKey.currentState!.validate()){
                               Get.toNamed(AppRoutes.resetPassswordScreen);
                             }
                           },
                             height: getVerticalSize(54),
                             text: "lbl_verify".tr,
                             margin: getMargin(top: 30)),
                         Padding(
                             padding: getPadding(top: 28),
                             child: Text("lbl_00_25".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtHeadline)),
                         Padding(
                             padding: getPadding(top: 22, bottom: 5),
                             child: RichText(
                                 text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_didn_t_receive_a2".tr,
                                      style: TextStyle(
                                          color: ColorConstant.fromHex("#6b6b6b"),
                                          fontSize: getFontSize(16),
                                          fontFamily: 'RobotoCondensed',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                          color: ColorConstant.fromHex("#000000"),
                                          fontSize: getFontSize(16),
                                          fontFamily: 'RobotoCondensed',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: "lbl_resend_code".tr,
                                      style: TextStyle(
                                          color: ColorConstant.fromHex("#1d718b"),
                                          fontSize: getFontSize(16),
                                          fontFamily: 'RobotoCondensed',
                                          fontWeight: FontWeight.w400))
                                 ]),
                                 textAlign: TextAlign.left))
                        ]),
                  )))));
 }


 onTapArrowleft1() {
  Get.back();
 }
}

