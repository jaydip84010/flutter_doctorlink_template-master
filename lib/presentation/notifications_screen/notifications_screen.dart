import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../notifications_screen/widgets/notifications_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notifications_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/notifications_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsController controller = Get.put(NotificationsController());
  List<NotificationsItemModel> notificationData =
      NotificationsModel.notificationsItemList();

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
                          onTapArrowleft21();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_notifications".tr),
                    styleType: Style.bgFillWhiteA700),
                body: notificationData.isEmpty
                    ? SizedBox(
                        width: double.maxFinite,
                        child: Container(
                            width: double.maxFinite,
                            margin: getMargin(top: 10),
                            padding: getPadding(
                                left: 69, top: 204, right: 69, bottom: 204),
                            decoration: AppDecoration.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath:
                                          ImageConstant.imgCardBlue50140x140,
                                      height: getSize(140),
                                      width: getSize(140)),
                                  Padding(
                                      padding: getPadding(top: 26),
                                      child: Text("msg_no_notifications".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtAvenirBlack28)),
                                  Padding(
                                      padding: getPadding(top: 10, bottom: 5),
                                      child: Text(
                                          "msg_it_is_a_long_established".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody))
                                ])))
                    : SizedBox(
                        width: double.maxFinite,
                        child: Container(
                            width: double.maxFinite,
                            margin: getMargin(top: 10),
                            padding: getPadding(left: 15, right: 15),
                            decoration: AppDecoration.white.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                          margin: getMargin(top: 16, right: 2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: ListView.separated(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                    height:
                                                        getVerticalSize(16));
                                              },
                                              itemCount:
                                                  notificationData.length,
                                              itemBuilder: (context, index) {
                                                NotificationsItemModel model =
                                                    notificationData[index];
                                                return NotificationsItemWidget(
                                                    model);
                                              })))
                                ]))))));
  }

  onTapArrowleft21() {
    Get.back();
  }
}
