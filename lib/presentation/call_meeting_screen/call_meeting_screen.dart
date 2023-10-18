import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/call_meeting_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';




class CallMeetingScreen extends StatefulWidget {
  const CallMeetingScreen({Key? key}) : super(key: key);

  @override
  State<CallMeetingScreen> createState() => _CallMeetingScreenState();
}

class _CallMeetingScreenState extends State<CallMeetingScreen> {
  CallMeetingController controller = Get.put(CallMeetingController());


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
          padding: getPadding(
            left: 96,
            right: 96,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse23,
                height: getSize(
                  188,
                ),
                width: getSize(
                  188,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    94,
                  ),
                ),
                margin: getMargin(
                  right: 14,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 24,
                ),
                child: Text(
                  "msg_dr_jenny_wilson3".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtAvenirBlack28,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 5,
                  right: 71,
                  bottom: 5,
                ),
                child: Text(
                  "lbl_13_35_min".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextRegular16,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: getPadding(
            left: 70,
            right: 70,
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 58,
                width: 58,
                variant: IconButtonVariant.FillGray200,
                shape: IconButtonShape.CircleBorder27,
                padding: IconButtonPadding.PaddingAll15,
                child: CustomImageView(
                  svgPath: ImageConstant.imgClock,
                ),
              ),
              Spacer(
                flex: 50,
              ),
              CustomIconButton(
                onTap: (){
                  Get.back();
                },
                height: 58,
                width: 58,
                variant: IconButtonVariant.FillRed600,
                shape: IconButtonShape.CircleBorder27,
                child: CustomImageView(
                  svgPath: ImageConstant.imgIccallfill,
                ),
              ),
              Spacer(
                flex: 50,
              ),
              CustomIconButton(
                height: 58,
                width: 58,
                variant: IconButtonVariant.FillGray200,
                shape: IconButtonShape.CircleBorder27,
                padding: IconButtonPadding.PaddingAll15,
                child: CustomImageView(
                  svgPath: ImageConstant.imgIcchatstokeBlack900,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}




