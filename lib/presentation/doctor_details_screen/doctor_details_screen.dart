import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/doctor_details_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';




class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
 DoctorDetailsController controller = Get.put(DoctorDetailsController());
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
          body: SizedBox(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
Container(
  height: getSize(320),
  width: double.infinity,
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(ImageConstant.imgDoctorDetail),fit: BoxFit.fill)
  ),
  child:  CustomIconButton(
      height: 36,
      width: 36,
      margin: getMargin(left: 16, top: 16),
      variant: IconButtonVariant.FillTeal50,
      alignment: Alignment.topLeft,
      onTap: () {
        onTapBtnArrowleft();
      },
      child: CustomImageView(
          svgPath: ImageConstant.imgArrowleftCyan800)),
),




                   Container(
                       width: double.maxFinite,
                       margin: getMargin(top: 8),
                       padding: getPadding(
                           left: 16, top: 14, right: 16, bottom: 14),
                       decoration: AppDecoration.white.copyWith(
                           borderRadius: BorderRadiusStyle.roundedBorder8),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            Padding(
                                padding: getPadding(top: 1),
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                     Text("msg_dr_jenny_wilson".tr,
                                         overflow: TextOverflow.ellipsis,
                                         textAlign: TextAlign.left,
                                         style: AppStyle.txtHeadline),
                                     Padding(
                                         padding: getPadding(top: 3),
                                         child: Text("lbl_cardiography".tr,
                                             overflow:
                                             TextOverflow.ellipsis,
                                             textAlign: TextAlign.left,
                                             style: AppStyle.txtFootnote))
                                    ])),
                            
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                              color: ColorConstant.gray200),
                            child: Padding(
                              padding:getPadding(left: 8,right: 8,top: 6.5,bottom: 6.5),
                              child: Row(

                                children: [
                                  CustomImageView(
                                      svgPath:
                                      ImageConstant.imgIcStarFill),
                                  SizedBox(width: getHorizontalSize(6),),
                                  Text("lbl_4_6".tr,style:TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    fontFamily: 'RobotoCondensed',
                                    fontWeight: FontWeight.w400,
                                  ) ,)
                                ],
                              ),
                            ),)
                            ,
                            
                            

                           ])),
                   Container(
                       width: double.maxFinite,
                       margin: getMargin(top: 12),
                       padding: getPadding(top: 16, bottom: 16,left: 16,right: 16),
                       decoration: AppDecoration.white.copyWith(
                           borderRadius: BorderRadiusStyle.roundedBorder8),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Expanded(
                                child: Container(
                                    margin: getMargin(right: 8),
                                    padding: getPadding(
                                        left: 16,
                                        top: 14,
                                        right: 16,
                                        bottom: 14),
                                    decoration: AppDecoration.fillGray50
                                        .copyWith(
                                        borderRadius: BorderRadiusStyle
                                            .roundedBorder8),
                                    child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                         CustomIconButton(
                                             height: 46,
                                             width: 46,
                                             margin: getMargin(
                                                 top: 7, bottom: 7),
                                             variant: IconButtonVariant
                                                 .FillTeal40063,
                                             shape: IconButtonShape
                                                 .CircleBorder23,
                                             child: CustomImageView(
                                                 svgPath: ImageConstant
                                                     .imgIcusergroupstoke)),
                                         Padding(
                                             padding: getPadding(
                                                 left: 16, bottom: 2),
                                             child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment
                                                     .start,
                                                 mainAxisAlignment:
                                                 MainAxisAlignment
                                                     .start,
                                                 children: [
                                                  Text("lbl_5000".tr,
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      textAlign:
                                                      TextAlign.left,
                                                      style: AppStyle
                                                          .txtBody),
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 8),
                                                      child: Text(
                                                          "lbl_patients"
                                                              .tr,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign
                                                              .left,
                                                          style: AppStyle
                                                              .txtBody))
                                                 ]))
                                        ]))),
                            Expanded(
                                child: Container(
                                    margin: getMargin(left: 8),
                                    padding: getPadding(
                                        left: 16,
                                        top: 14,
                                        right: 16,
                                        bottom: 14),
                                    decoration: AppDecoration.fillGray50
                                        .copyWith(
                                        borderRadius: BorderRadiusStyle
                                            .roundedBorder8),
                                    child: Row(children: [
                                     CustomIconButton(
                                         height: 46,
                                         width: 46,
                                         margin:
                                         getMargin(top: 7, bottom: 7),
                                         variant: IconButtonVariant
                                             .FillTeal40063,
                                         shape: IconButtonShape
                                             .CircleBorder23,
                                         child: CustomImageView(
                                             svgPath: ImageConstant
                                                 .imgIcuserstoke)),
                                     Padding(
                                         padding: getPadding(left: 16),
                                         child: Column(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                             mainAxisAlignment:
                                             MainAxisAlignment.start,
                                             children: [
                                              Text("lbl_15_years".tr,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  textAlign:
                                                  TextAlign.left,
                                                  style:
                                                  AppStyle.txtBody),
                                              Padding(
                                                  padding:
                                                  getPadding(top: 9),
                                                  child: Text(
                                                      "lbl_experiences"
                                                          .tr,
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      textAlign:
                                                      TextAlign.left,
                                                      style: AppStyle
                                                          .txtBody))
                                             ]))
                                    ])))
                           ])),
                   SizedBox(
                       width: double.maxFinite,
                       child: Container(
                           margin: getMargin(left: 1, top: 8, bottom: 5),
                           padding: getPadding(
                               left: 15, top: 13, right: 15, bottom: 13),
                           decoration: AppDecoration.white.copyWith(
                               borderRadius:
                               BorderRadiusStyle.roundedBorder8),
                           child: Column(
                               mainAxisSize: MainAxisSize.min,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                Padding(
                                    padding: getPadding(left: 1),
                                    child: Text("lbl_about_doctor".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline)),
                                Container(
                                    width: getHorizontalSize(394),
                                    margin: getMargin(left: 1, top: 9),
                                    child: Text("msg_dr_jenny_wilson2".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtBody)),
                                Padding(
                                    padding: getPadding(top: 15),
                                    child: Text("lbl_working_time".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline)),
                                Padding(
                                    padding: getPadding(top: 6, bottom: 2),
                                    child: Text("msg_mon_sun_09_00_am".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtBody))
                               ])))
                  ])),
          bottomNavigationBar: Container(
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
             child: Padding(
               padding: getPadding(left: 16,right: 16,top: 17,bottom: 40),
               child: CustomButton(
                    height: getVerticalSize(54),
                    text: "msg_book_appointment".tr,
                    onTap: () {
                      onTapBook();
                    }),
             )
          ),





          )));
 }

 onTapBtnArrowleft() {
  Get.back();
 }

 onTapBook() {
  Get.toNamed(
   AppRoutes.bookAppointmentScreen,
  );
 }
}






