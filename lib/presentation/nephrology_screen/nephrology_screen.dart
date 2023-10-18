import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../filter_screen/filter_screen.dart';
import '../nephrology_screen/widgets/nephrology_item_widget.dart';
import 'controller/nephrology_controller.dart';
import 'models/nephrology_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/nephrology_model.dart';



class NephrologyScreen extends StatefulWidget {
  const NephrologyScreen({Key? key}) : super(key: key);

  @override
  State<NephrologyScreen> createState() => _NephrologyScreenState();
}

class _NephrologyScreenState extends State<NephrologyScreen> {
  NephrologyController controller = Get.put(NephrologyController());
  List<NephrologyItemModel> nephrologyData = NephrologyModel.nephrologyItemList();
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
    return  WillPopScope(
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
                      onTapArrowleft11();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_nephrology".tr),
                actions: [
                  AppbarImage(
                      onTap: (){
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(getHorizontalSize(32)),
                                  topRight:
                                  Radius.circular(getHorizontalSize(32)))),
                          builder: (context) {
                            return FilterScreen();
                          },
                        );
                      },
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettingsBlack900,
                      margin:
                      getMargin(left: 16, top: 29, right: 16, bottom: 26))
                ],
                styleType: Style.bgFillWhiteA700),
            body: Container(
                margin: getMargin(top: 8),

                decoration: AppDecoration.white,
                child: ListView.separated(
                    padding: getPadding(left: 16, top: 8, right: 16, bottom: 8),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: nephrologyData.length,
                    itemBuilder: (context, index) {
                      NephrologyItemModel model = nephrologyData[index];
                      return NephrologyItemWidget(model,
                          onTapPopulardoctor: () {
                            onTapPopulardoctor();
                          });
                    })))));
  }

  onTapPopulardoctor() {
    Get.toNamed(AppRoutes.doctorDetailsScreen);
  }

  onTapArrowleft11() {
    Get.back();
  }
}


