import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../filter_screen/filter_screen.dart';
import '../home_page_screen/models/home_page_model.dart';
import '../home_page_screen/models/popular_doctor_model.dart';
import '../popular_doctors_screen/widgets/populardoctors_item_widget.dart';
import 'controller/popular_doctors_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';


class PopularDoctorsScreen extends StatefulWidget {
  const PopularDoctorsScreen({Key? key}) : super(key: key);

  @override
  State<PopularDoctorsScreen> createState() => _PopularDoctorsScreenState();
}

class _PopularDoctorsScreenState extends State<PopularDoctorsScreen> {
 PopularDoctorsController controller = Get.put(PopularDoctorsController());
 List<PopularDoctor> populerDoctor = HomePageModel.getPopularDoctor();
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
                   onTapArrowleft8();
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_popular_doctors".tr),
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
          body: SizedBox(
              width: double.maxFinite,
              child: Container(
                  width: double.maxFinite,
                  margin: getMargin(top: 8),
                  padding: getPadding(left: 16, right: 16),
                  decoration: AppDecoration.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Expanded(
                           child: Padding(
                               padding: getPadding(top: 16),
                               child: GridView.builder(
                                   shrinkWrap: true,
                                   gridDelegate:
                                   SliverGridDelegateWithFixedCrossAxisCount(
                                       mainAxisExtent:
                                       getVerticalSize(187),
                                       crossAxisCount: 2,
                                       mainAxisSpacing:
                                       getHorizontalSize(16),
                                       crossAxisSpacing:
                                       getHorizontalSize(16)),
                                   physics: BouncingScrollPhysics(),
                                   itemCount: populerDoctor
                                       .length,
                                   itemBuilder: (context, index) {
                                     PopularDoctor model =
                                     populerDoctor[index];
                                     return PopulardoctorsItemWidget(model);
                                   })))
                      ]))))));
 }

 onTapArrowleft8() {
  Get.back();
 }
}





