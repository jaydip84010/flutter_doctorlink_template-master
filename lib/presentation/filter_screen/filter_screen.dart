import 'controller/filter_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FilterScreen extends GetWidget<FilterController> {
   FilterScreen({Key? key})
      : super(
          key: key,
        );
  FilterController controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL32,
      ),
      child: Padding(
        padding: getPadding(top: 28,bottom: 40),
        child: Column(
        mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Filter",style: TextStyle(
                color: ColorConstant.black900,
                fontSize: getFontSize(
                  20,
                ),
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w400,
              ),),
            ),
            Divider(color: ColorConstant.gray300,),
            Padding(
              padding: getPadding(left: 16,right: 16),
              child: Text(
                "lbl_now_or_later".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtHeadline,
              ),
            ),
            SizedBox(height: getVerticalSize(16),),
            getNowOrLaterButton(1, "lbl_anytime".tr),
            SizedBox(height: getVerticalSize(8),),
            getNowOrLaterButton(2, "lbl_today".tr),
            SizedBox(height: getVerticalSize(8),),
            getNowOrLaterButton(3, "lbl_sunday_26_jun".tr),
            SizedBox(height: getVerticalSize(8),),
            getNowOrLaterButton(4, "lbl_next_week".tr),
            Padding(
              padding: getPadding(
                top: 17,left: 16,right: 16
              ),
              child: Text(
                "lbl_meet_the_doctor".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtHeadline,
              ),
            ),
            SizedBox(height: getVerticalSize(8),),
            getMeetTheDoctorButton(1,"lbl_clinic".tr ),
            SizedBox(height: getVerticalSize(8),),
            getMeetTheDoctorButton(2,"lbl_video_call".tr ),
            SizedBox(height: getVerticalSize(8),),
            getMeetTheDoctorButton(3,"lbl_hospital".tr ),

            Padding(
              padding: getPadding(
                top: 16,left: 16,right: 16
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: (){Get.back();},
                      height: getVerticalSize(
                        54,
                      ),
                      text: "lbl_reset".tr,
                      margin: getMargin(
                        right: 8,
                      ),
                      variant: ButtonVariant.FillBlue50,
                      fontStyle: ButtonFontStyle
                          .AvenirBlack18Cyan800,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: (){Get.back();},
                      height: getVerticalSize(
                        54,
                      ),
                      text: "lbl_apply".tr,
                      margin: getMargin(
                        left: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNowOrLaterButton(id,text){
    return  Padding(
      padding: getPadding(left: 16,right: 16),
      child: GetBuilder<FilterController>(
        init: FilterController(),
        builder:(controller) =>  GestureDetector(
          onTap: (){
            controller.setNowOrLaterId(id);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(getHorizontalSize(8)),
              color: ColorConstant.gray5001,),
            child: Padding(
              padding: getPadding(left: 16,bottom: 12,right: 16,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,style:TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w300,
                  )),
                  CustomImageView(
                    svgPath: controller.currentNowOrLaterId == id?ImageConstant.imgRadioButtonSelected:
                    ImageConstant.imgRadioButtonunSelected,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   Widget getMeetTheDoctorButton(id,text){
     return  Padding(
       padding: getPadding(left: 16,right: 16),
       child: GetBuilder<FilterController>(
         init: FilterController(),
         builder:(controller) =>  GestureDetector(
           onTap: (){
             controller.setMeettheDoctorId(id);
           },
           child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(getHorizontalSize(8)),
               color: ColorConstant.gray5001,),
             child: Padding(
               padding: getPadding(left: 16,bottom: 12,right: 16,top: 12),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(text,style:TextStyle(
                     color: ColorConstant.black900,
                     fontSize: getFontSize(
                       16,
                     ),
                     fontFamily: 'RobotoCondensed',
                     fontWeight: FontWeight.w300,
                   )),
                   CustomImageView(
                     svgPath: controller.currentMeetDoctor == id?ImageConstant.imgRadioButtonSelected:
                     ImageConstant.imgRadioButtonunSelected,
                   )
                 ],
               ),
             ),
           ),
         ),
       ),
     );
   }
}
