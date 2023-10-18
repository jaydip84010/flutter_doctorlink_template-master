import 'controller/app_navigation_controller.dart';import 'package:doctorapp/core/app_export.dart';import 'package:flutter/material.dart';class AppNavigationScreen extends GetWidget<AppNavigationController> {const AppNavigationScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, body: SizedBox(width: getHorizontalSize(375), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_app_navigation".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20), child: Text("msg_check_your_app_s".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular16))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.black900))])), Expanded(child: SingleChildScrollView(child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [GestureDetector(onTap: () {onTapSplashTwo();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_splash_two".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapGrid();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_grid".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSplash();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_splash".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSplashOne();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_splash_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingOne();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingTwo();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_two".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingThree();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_three".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSignin();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_sign_in".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapLoginWitherror();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_log_in_with_error".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSignup();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_sign_up2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSwitchcontorycode();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_switch_contory_code".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapForgotpassword();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_forgot_password".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapVerification();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_verification".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapVerificationwitherror();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_verification_with".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapResetpasssword();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_reset_passsword".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapResetpassswordsuccess();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_reset_passsword".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapFilter();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_filter".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapDoctordetails();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_doctor_details".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapBookAppointment();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_book_appointment2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapPaymentmethod();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_payment_method".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapPaymentmethod1();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_payment_method".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapHomepage();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_home_page".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapSpecialist();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_specialist".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapPopulardoctors();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_popular_doctors".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapAvaliabledoctors();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_avaliable_doctors".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapOrthopedic();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_orthopedic".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapNephrology();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_nephrology".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapPulmonology();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_pulmonology".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapBokkingsuccess();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_bokking_success".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapNeurologist();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_neurologist".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapEmptyAppointment();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_empty_appointment".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapMyAppoiments();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_my_appoiments".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapAppoimentsdetails();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_appoiments_details".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapEmptychat();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_empty_chat".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapChat();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_chat2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapChat1();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_chat2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapCallmeeting();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_call_meeting".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapVideocall();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_video_call".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapChatdetails();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_chat_details".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapProfille();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_profille".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapProfiledetails();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_profile_details".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapEditprofile();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_edit_profile".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapAddacardOne();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_a_card_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapAddacard();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_a_card".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapMycards();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_my_cards".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapEmptyNotifications();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_empty_notifications".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapNotifications();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_notifications".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapPrivacypolicy();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_privacy_policy".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapLogout();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_log_out".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))]))), GestureDetector(onTap: () {onTapEmptyMycards();}, child: Container(decoration: AppDecoration.white, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_empty_my_cards".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtRobotoRegular20))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray400))])))]))))])))); } 
/// Navigates to the splashTwoScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the splashTwoScreen.
onTapSplashTwo() { Get.toNamed(AppRoutes.splashTwoScreen, ); } 
/// Navigates to the gridScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the gridScreen.
onTapGrid() { Get.toNamed(AppRoutes.gridScreen, ); } 
/// Navigates to the splashScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the splashScreen.
onTapSplash() { Get.toNamed(AppRoutes.splashScreen, ); } 
/// Navigates to the splashOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the splashOneScreen.
onTapSplashOne() { Get.toNamed(AppRoutes.splashOneScreen, ); } 
/// Navigates to the onboardingOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingOneScreen.
onTapOnboardingOne() { Get.toNamed(AppRoutes.onboardingOneScreen, ); } 
/// Navigates to the onboardingTwoScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingTwoScreen.
onTapOnboardingTwo() { Get.toNamed(AppRoutes.onboardingTwoScreen, ); } 
/// Navigates to the onboardingThreeScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingThreeScreen.
onTapOnboardingThree() { Get.toNamed(AppRoutes.onboardingThreeScreen, ); } 
/// Navigates to the signInScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the signInScreen.
onTapSignin() { Get.toNamed(AppRoutes.signInScreen, ); } 
/// Navigates to the logInWithErrorScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the logInWithErrorScreen.
onTapLoginWitherror() { Get.toNamed(AppRoutes.logInWithErrorScreen, ); } 
/// Navigates to the signUpScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the signUpScreen.
onTapSignup() { Get.toNamed(AppRoutes.signUpScreen, ); } 
/// Navigates to the switchContoryCodeScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the switchContoryCodeScreen.
onTapSwitchcontorycode() { Get.toNamed(AppRoutes.switchContoryCodeScreen, ); } 
/// Navigates to the forgotPasswordScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the forgotPasswordScreen.
onTapForgotpassword() { Get.toNamed(AppRoutes.forgotPasswordScreen, ); } 
/// Navigates to the verificationScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the verificationScreen.
onTapVerification() { Get.toNamed(AppRoutes.verificationScreen, ); } 
/// Navigates to the verificationWithErrorScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the verificationWithErrorScreen.
onTapVerificationwitherror() { Get.toNamed(AppRoutes.verificationWithErrorScreen, ); } 
/// Navigates to the resetPassswordScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the resetPassswordScreen.
onTapResetpasssword() { Get.toNamed(AppRoutes.resetPassswordScreen, ); } 
/// Navigates to the resetPassswordSuccessScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the resetPassswordSuccessScreen.
onTapResetpassswordsuccess() { Get.toNamed(AppRoutes.resetPassswordSuccessScreen, ); } 
/// Navigates to the filterScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the filterScreen.
onTapFilter() { Get.toNamed(AppRoutes.filterScreen, ); } 
/// Navigates to the doctorDetailsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the doctorDetailsScreen.
onTapDoctordetails() { Get.toNamed(AppRoutes.doctorDetailsScreen, ); } 
/// Navigates to the bookAppointmentScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the bookAppointmentScreen.
onTapBookAppointment() { Get.toNamed(AppRoutes.bookAppointmentScreen, ); } 
/// Navigates to the paymentMethodScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the paymentMethodScreen.
onTapPaymentmethod() { Get.toNamed(AppRoutes.paymentMethodScreen, ); } 
/// Navigates to the paymentMethod1Screen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the paymentMethod1Screen.
onTapPaymentmethod1() { Get.toNamed(AppRoutes.paymentMethod1Screen, ); } 
/// Navigates to the homePageScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the homePageScreen.
onTapHomepage() { Get.toNamed(AppRoutes.homePageScreen, ); } 
/// Navigates to the specialistScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the specialistScreen.
onTapSpecialist() { Get.toNamed(AppRoutes.specialistScreen, ); } 
/// Navigates to the popularDoctorsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the popularDoctorsScreen.
onTapPopulardoctors() { Get.toNamed(AppRoutes.popularDoctorsScreen, ); } 
/// Navigates to the avaliableDoctorsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the avaliableDoctorsScreen.
onTapAvaliabledoctors() { Get.toNamed(AppRoutes.avaliableDoctorsScreen, ); } 
/// Navigates to the orthopedicScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the orthopedicScreen.
onTapOrthopedic() { Get.toNamed(AppRoutes.orthopedicScreen, ); } 
/// Navigates to the nephrologyScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the nephrologyScreen.
onTapNephrology() { Get.toNamed(AppRoutes.nephrologyScreen, ); } 
/// Navigates to the pulmonologyScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the pulmonologyScreen.
onTapPulmonology() { Get.toNamed(AppRoutes.pulmonologyScreen, ); } 
/// Navigates to the bokkingSuccessScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the bokkingSuccessScreen.
onTapBokkingsuccess() { Get.toNamed(AppRoutes.bokkingSuccessScreen, ); } 
/// Navigates to the neurologistScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the neurologistScreen.
onTapNeurologist() { Get.toNamed(AppRoutes.neurologistScreen, ); } 
/// Navigates to the emptyAppointmentScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the emptyAppointmentScreen.
onTapEmptyAppointment() { Get.toNamed(AppRoutes.emptyAppointmentScreen, ); } 
/// Navigates to the myAppoimentsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the myAppoimentsScreen.
onTapMyAppoiments() { Get.toNamed(AppRoutes.myAppoimentsScreen, ); } 
/// Navigates to the appoimentsDetailsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the appoimentsDetailsScreen.
onTapAppoimentsdetails() { Get.toNamed(AppRoutes.appoimentsDetailsScreen, ); } 
/// Navigates to the emptyChatScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the emptyChatScreen.
onTapEmptychat() { Get.toNamed(AppRoutes.emptyChatScreen, ); } 
/// Navigates to the chatScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the chatScreen.
onTapChat() { Get.toNamed(AppRoutes.chatScreen, ); } 
/// Navigates to the chat1Screen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the chat1Screen.
onTapChat1() { Get.toNamed(AppRoutes.chat1Screen, ); } 
/// Navigates to the callMeetingScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the callMeetingScreen.
onTapCallmeeting() { Get.toNamed(AppRoutes.callMeetingScreen, ); } 
/// Navigates to the videoCallScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the videoCallScreen.
onTapVideocall() { Get.toNamed(AppRoutes.videoCallScreen, ); } 
/// Navigates to the chatDetailsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the chatDetailsScreen.
onTapChatdetails() { Get.toNamed(AppRoutes.chatDetailsScreen, ); } 
/// Navigates to the profilleScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the profilleScreen.
onTapProfille() { Get.toNamed(AppRoutes.profilleScreen, ); } 
/// Navigates to the profileDetailsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the profileDetailsScreen.
onTapProfiledetails() { Get.toNamed(AppRoutes.profileDetailsScreen, ); } 
/// Navigates to the editProfileScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the editProfileScreen.
onTapEditprofile() { Get.toNamed(AppRoutes.editProfileScreen, ); } 
/// Navigates to the addACardOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the addACardOneScreen.
onTapAddacardOne() { Get.toNamed(AppRoutes.addACardOneScreen, ); } 
/// Navigates to the addACardScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the addACardScreen.
onTapAddacard() { Get.toNamed(AppRoutes.addACardScreen, ); } 
/// Navigates to the myCardsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the myCardsScreen.
onTapMycards() { Get.toNamed(AppRoutes.myCardsScreen, ); } 
/// Navigates to the emptyNotificationsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the emptyNotificationsScreen.
onTapEmptyNotifications() { Get.toNamed(AppRoutes.emptyNotificationsScreen, ); } 
/// Navigates to the notificationsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the notificationsScreen.
onTapNotifications() { Get.toNamed(AppRoutes.notificationsScreen, ); } 
/// Navigates to the privacyPolicyScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the privacyPolicyScreen.
onTapPrivacypolicy() { Get.toNamed(AppRoutes.privacyPolicyScreen, ); } 
/// Navigates to the logOutScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the logOutScreen.
onTapLogout() { Get.toNamed(AppRoutes.logOutScreen, ); } 
/// Navigates to the emptyMyCardsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the emptyMyCardsScreen.
onTapEmptyMycards() { Get.toNamed(AppRoutes.emptyMyCardsScreen, ); } 
 }
