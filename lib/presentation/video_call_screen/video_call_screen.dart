import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/video_call_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';





class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  VideoCallController controlelr = Get.put(VideoCallController());
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
        backgroundColor: ColorConstant.teal5001,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.imgVidioCall),fit: BoxFit.fill)),
          child: Padding(
            padding: getPadding(top:44, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: getPadding(right: 36),
                  child: Container(
                    height: getSize(192),
                    width: getSize(164),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVidioCallUser,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 70,right: 70,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        height: 58,
                        width: 58,
                        variant: IconButtonVariant.FillGray200,
                        shape: IconButtonShape.CircleBorder27,
                        padding: IconButtonPadding.PaddingAll15,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgVidioCallLine,
                        ),
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
              ],
            ),
          ),
        ),
    )













      ),
    );
  }
}









