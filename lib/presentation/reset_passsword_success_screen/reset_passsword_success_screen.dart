import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/reset_passsword_success_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';





class ResetPassswordSuccessScreen extends StatefulWidget {
  const ResetPassswordSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassswordSuccessScreen> createState() => _ResetPassswordSuccessScreenState();
}

class _ResetPassswordSuccessScreenState extends State<ResetPassswordSuccessScreen> {
  ResetPassswordSuccessController controller = Get.put(ResetPassswordSuccessController());

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
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 49, right: 49),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color: ColorConstant.blue50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder77),
                          child: Container(
                              height: getVerticalSize(154),
                              width: getHorizontalSize(153),
                              padding: getPadding(
                                  left: 42, top: 37, right: 42, bottom: 37),
                              decoration: AppDecoration.fillBlue50.copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.circleBorder77),
                              child: Stack(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgLock,
                                    height: getVerticalSize(80),
                                    width: getHorizontalSize(66),
                                    alignment: Alignment.center)
                              ]))),
                      Padding(
                          padding: getPadding(top: 34),
                          child: Text("msg_password_reset_successfully".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAvenirBlack22)),
                      Container(
                          width: getHorizontalSize(322),
                          margin: getMargin(top: 13, right: 5),
                          child: Text("msg_you_have_successfully".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtBody)),
                      CustomButton(
                          height: getVerticalSize(53),
                          text: "lbl_go_to_log_in".tr,
                          margin: getMargin(
                              left: 39, top: 33, right: 39, bottom: 5),
                          onTap: () {
                            onTapGotologin();
                          })
                    ])))));
  }

  onTapGotologin() {
    Get.offAllNamed(AppRoutes.signInScreen);
  }
}



