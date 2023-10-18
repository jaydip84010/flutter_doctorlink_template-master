import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/profile_details_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

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
                          onTapArrowleft15();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_my_profile".tr),
                    actions: [
                      AppbarImage(
                        onTap: (){
                          Get.toNamed(AppRoutes.editProfileScreen);
                        },
                          height: getSize(24),
                          width: getSize(24),
                          svgPath: ImageConstant.imgEdit,
                          margin: getMargin(
                              left: 16, top: 29, right: 16, bottom: 26))
                    ],
                    styleType: Style.bgFillWhiteA700),
                body:




                Container(
                    margin: getMargin(top: 8),
                    padding: getPadding(
                        left: 16, top: 40, right: 16, bottom: 0),
                    decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8),
                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse240,
                              height: getSize(110),
                              width: getSize(110),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(55)),
                              alignment: Alignment.center),
                          Padding(
                              padding: getPadding(top: 28),
                              child: Text("lbl_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtFootnoteGray600)),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("lbl_ronald_richards2".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody)),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Divider(
                                  height: getVerticalSize(1),
                                  thickness: getVerticalSize(1),
                                  color: ColorConstant.gray200,
                                  endIndent: getHorizontalSize(22))),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_email".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtFootnoteGray600)),
                          Padding(
                              padding: getPadding(top: 13),
                              child: Text("msg_ronaldrichards_gmail_com".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody)),
                          Padding(
                              padding: getPadding(top: 15),
                              child: Divider(
                                  height: getVerticalSize(1),
                                  thickness: getVerticalSize(1),
                                  color: ColorConstant.gray200,
                                  endIndent: getHorizontalSize(22))),
                          Padding(
                              padding: getPadding(top: 12),
                              child: Text("lbl_phone_number".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtFootnoteGray600)),
                          Padding(
                              padding: getPadding(top: 13),
                              child: Text("lbl_219_555_0114".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody)),
                          Padding(
                              padding: getPadding(top: 16, bottom: 5),
                              child: Divider(
                                  height: getVerticalSize(1),
                                  thickness: getVerticalSize(1),
                                  color: ColorConstant.gray200,
                                  endIndent: getHorizontalSize(22)))
                        ]))

            )));
  }

  onTapArrowleft15() {
    Get.back();
  }
}
