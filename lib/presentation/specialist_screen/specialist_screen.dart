import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../home_page_screen/models/home_page_model.dart';
import '../home_page_screen/models/specialist_category_model.dart';
import '../specialist_screen/widgets/specialist_item_widget.dart';
import 'controller/specialist_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({Key? key}) : super(key: key);

  @override
  State<SpecialistScreen> createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  List<SpecialistCategory> specialistCategory =
      HomePageModel.getSpecialistCategory();
  SpecialistController controller = Get.put(SpecialistController());

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
                          onTapArrowleft7();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_specialist".tr),
                    styleType: Style.bgFillWhiteA700),
                body: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        width: double.maxFinite,
                        margin: getMargin(top: 8),
                        padding: getPadding(all: 16),
                        decoration: AppDecoration.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  getVerticalSize(137),
                                              crossAxisCount: 3,
                                              mainAxisSpacing:
                                                  getHorizontalSize(24),
                                              crossAxisSpacing:
                                                  getHorizontalSize(45)),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: specialistCategory.length,
                                      itemBuilder: (context, index) {
                                        SpecialistCategory model =
                                            specialistCategory[index];
                                        return SpecialistItemWidget(
                                            model, index);
                                      }))
                            ]))))));
  }

  onTapArrowleft7() {
    Get.back();
  }
}
