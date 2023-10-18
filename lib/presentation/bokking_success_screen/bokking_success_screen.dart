import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/bokking_success_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class BokkingSuccessScreen extends StatefulWidget {
  const BokkingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<BokkingSuccessScreen> createState() => _BokkingSuccessScreenState();
}

class _BokkingSuccessScreenState extends State<BokkingSuccessScreen> {
 BokkingSuccessController controller = Get.put(BokkingSuccessController());
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
        Get.offAllNamed(AppRoutes.homePAgeContainer);
   return false;
  },
  child: ColorfulSafeArea(
  color: ColorConstant.whiteA700,
  child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: SizedBox(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   CustomImageView(
                       svgPath: ImageConstant.imgIconBlue50,
                       height: getVerticalSize(154),
                       width: getHorizontalSize(153)),
                   Padding(
                       padding: getPadding(top: 34),
                       child: Text("msg_your_booking_successfully".tr,
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtAvenirBlack22)),
                   Container(
                       width: getHorizontalSize(216),
                       margin: getMargin(top: 13),
                       child: Text("msg_you_have_successfully2".tr,
                           maxLines: null,
                           textAlign: TextAlign.center,
                           style: AppStyle.txtBody)),
                   CustomButton(
                       height: getVerticalSize(53),
                       width: getHorizontalSize(250),
                       text: "lbl_go_to_home".tr,
                       margin: getMargin(top: 33, bottom: 5),
                       onTap: () {
                        onTapGotohome();
                       })
                  ])))));
 }


 onTapGotohome() {
 Get.offAllNamed(AppRoutes.homePAgeContainer);
 }
}

