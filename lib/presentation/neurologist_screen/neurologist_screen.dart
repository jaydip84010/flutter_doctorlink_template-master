import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../filter_screen/filter_screen.dart';
import '../neurologist_screen/widgets/neurologist_item_widget.dart';
import 'controller/neurologist_controller.dart';
import 'models/neurologist_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/neurologist_model.dart';

class NeurologistScreen extends StatefulWidget {
  const NeurologistScreen({Key? key}) : super(key: key);

  @override
  State<NeurologistScreen> createState() => _NeurologistScreenState();
}

class _NeurologistScreenState extends State<NeurologistScreen> {
  NeurologistController controller = Get.put(NeurologistController());
  List<NeurologistItemModel> neurologistData = NeurologistModel.neurologistItemList();

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
                          onTapArrowleft13();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_neurologist".tr),
                    actions: [
                      AppbarImage(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getHorizontalSize(32)),
                                      topRight: Radius.circular(
                                          getHorizontalSize(32)))),
                              builder: (context) {
                                return FilterScreen();
                              },
                            );
                          },
                          height: getSize(24),
                          width: getSize(24),
                          svgPath: ImageConstant.imgSettingsBlack900,
                          margin: getMargin(
                              left: 16, top: 29, right: 16, bottom: 26))
                    ],
                    styleType: Style.bgFillWhiteA700),
                body: Padding(
                  padding:getPadding(top: 8),
                  child: Container(

                      decoration: AppDecoration.white,
                      child: ListView.separated(
                          padding: getPadding(left: 16, right: 16,top: 16,bottom: 16),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: getVerticalSize(16));
                          },
                          itemCount: neurologistData.length,
                          itemBuilder: (context, index) {
                            NeurologistItemModel model = neurologistData[index];
                            return NeurologistItemWidget(model,
                                onTapPopulardoctor: () {
                              onTapPopulardoctor();
                            });
                          })),
                ))));
  }

  onTapPopulardoctor() {
    Get.toNamed(AppRoutes.doctorDetailsScreen);
  }

  onTapArrowleft13() {
    Get.back();
  }
}
