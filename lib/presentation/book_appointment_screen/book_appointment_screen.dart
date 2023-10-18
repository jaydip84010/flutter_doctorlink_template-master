import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../book_appointment_screen/widgets/book_item_widget.dart';
import 'controller/book_appointment_controller.dart';
import 'models/book_appointment_model.dart';
import 'models/book_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  BookAppointmentController bookAppointmentController = Get.put(BookAppointmentController());
  List<BookItemModel> slotData =  BookAppointmentModel.bookItemList();
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
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          onTapArrowleft4();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "msg_book_appointment2".tr),
                    styleType: Style.bgFillWhiteA700),
                body: GetBuilder<BookAppointmentController>(
                  init: BookAppointmentController(),
                  builder:(controller) =>  Container(
                      width: double.maxFinite,
                      padding: getPadding(top: 16, bottom: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: double.maxFinite,
                                child: Container(
                                    padding: getPadding(
                                        left: 16, top: 9, right: 16, bottom: 9),
                                    decoration: AppDecoration.white.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 4),
                                              child: Text(
                                                  "lbl_select_schedule".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtHeadline)),
                                          Padding(
                                              padding: getPadding(
                                                  top: 16, right: 21),
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: getVerticalSize(
                                                          81),
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing:
                                                      getHorizontalSize(
                                                          16),
                                                      crossAxisSpacing:
                                                      getHorizontalSize(
                                                          24)),
                                                  physics:
                                                  NeverScrollableScrollPhysics(),
                                                  itemCount: slotData
                                                      .length,
                                                  itemBuilder: (context, index) {
                                                    BookItemModel model = slotData[index];
                                                    return BookItemWidget(model,index);
                                                  }))
                                        ]))),
                            SizedBox(height: getVerticalSize(38),),
                            Text("lbl_today_23_jan".tr,style: AppStyle.txtSubheadline,),
                            // CustomButton(
                            //     height: getVerticalSize(40),
                            //     text: "lbl_today_23_jan".tr,
                            //     margin: getMargin(top: 19),
                            //     variant: ButtonVariant.FillWhiteA700,
                            //     shape: ButtonShape.Square,
                            //     padding: ButtonPadding.PaddingAll9,
                            //     fontStyle: ButtonFontStyle.SubheadlineGray600),
                            SizedBox(
                                width: double.maxFinite,
                                child: Container(
                                    width: double.maxFinite,
                                    margin: getMargin(top: 16, bottom: 5),
                                    padding: getPadding(
                                        left: 16, top: 13, right: 16, bottom: 13),
                                    decoration: AppDecoration.white.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("msg_available_time_slot".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtHeadline),
                                          Padding(
                                              padding: getPadding(top: 9),
                                              child: Text("lbl_morning_slot".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtSubheadline)),
                                          Padding(
                                              padding:
                                                  getPadding(top: 8, right: 67),
                                              child: Row(children: [
                                                slot_time_button(1, "lbl_08_00_am".tr),
                                                SizedBox(width: getHorizontalSize(16),),
                                                slot_time_button(2, "lbl_10_00_am".tr),
                                                SizedBox(width: getHorizontalSize(16),),
                                                slot_time_button(3,"12:00 AM"),

                                              ])),
                                          Padding(
                                              padding: getPadding(top: 16),
                                              child: Text("lbl_afternoon_slot".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtSubheadline)),
                                          Padding(
                                              padding: getPadding(
                                                  top: 8, right: 67, bottom: 2),
                                              child: Row(children: [


                                                Row(children: [
                                                  slot_time_button(4, "lbl_04_00_pm".tr),
                                                  SizedBox(width: getHorizontalSize(16),),
                                                  slot_time_button(5, "lbl_06_00_pm".tr),
                                                  SizedBox(width: getHorizontalSize(16),),
                                                  slot_time_button(6,"lbl_08_00_pm".tr),

                                                ])


                                              ]))
                                        ])))
                          ])),
                ),
                bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "lbl_continue".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                      onTapContinue();
                    }))));
  }

  onTapContinue() {
    Get.toNamed(AppRoutes.paymentMethodScreen);
    // TODO: implement Actions
  }

  onTapArrowleft4() {
    Get.back();
  }


  Widget slot_time_button(id,text){
    return  GetBuilder<BookAppointmentController>(
      init: BookAppointmentController(),
      builder:(controller) =>  GestureDetector(
        onTap: (){
controller.setCurrentTime(id);
        },
        child: Container(
          width: getSize(99),
          height: getSize(33),
          decoration: controller.currentTimeId == id?AppDecoration
              .txtFillCyan800
              .copyWith(
              borderRadius:
              BorderRadiusStyle
                  .txtRoundedBorder8):AppDecoration
              .fillGray50
              .copyWith(
              borderRadius:
              BorderRadiusStyle
                  .txtRoundedBorder8),
          child: Center(
            child: Text(text,
                overflow:
                TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: controller.currentTimeId==id?AppStyle
                    .txtSFProDisplayRegular14:AppStyle.txtSFProDisplayRegular14Black900),
          ),
        ),
      ),
    );
  }


}
