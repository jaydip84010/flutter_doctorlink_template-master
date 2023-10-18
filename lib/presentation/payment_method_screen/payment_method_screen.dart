import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doctorapp/presentation/payment_method_screen/widgets/custom_drop_down.dart';
import 'package:flutter/services.dart';

import '../payment_method_screen/widgets/paymentmethod_item_widget.dart';
import 'controller/payment_method_controller.dart';
import 'models/payment_method_model.dart';
import 'models/paymentmethod_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
 PaymentMethodController controller = Get.put(PaymentMethodController());
 List<PaymentmethodItemModel> paymentMethod =  PaymentMethodModel.paymentmethodItemList();
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
          resizeToAvoidBottomInset: false,
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
                   onTapArrowleft5();
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_payment_method".tr),
              styleType: Style.bgFillWhiteA700),
          body: SizedBox(
              width: double.maxFinite,
              child: Container(
                  width: double.maxFinite,
                  margin: getMargin(top: 8),
                  padding:
                  getPadding(left: 16, top: 13, right: 16, bottom: 13),
                  decoration: AppDecoration.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Text("lbl_select_duration".tr,
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtHeadline),
SizedBox(height: getVerticalSize(17),),

                        CustomDropDown(
                            suffixConstraints: BoxConstraints(minHeight: getSize(54),
                                maxHeight: getSize(54)),
                            icon: Container(
                                margin: getMargin(left: 30, right: 16),
                                child: CustomImageView(
                                    svgPath: ImageConstant
                                        .imgdropDownIcon)),
                            hintText: "lbl_30_min".tr,
                            prefix: Container(
                                margin: getMargin(
                                    left: 16, top: 15, right: 8, bottom: 15),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgIcClockStoke)),
                            prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(54)),
                            fontStyle: DropDownFontStyle.SFUITextRegular15,
                            items: controller.addNewCardModelObj.value
                                .dropdownItemList.value,
                            onChanged: (value) {
                              controller.onSelected(value);
                            }),

                       Padding(
                           padding: getPadding(top: 15),
                           child: Text("lbl_select_package2".tr,
                               overflow: TextOverflow.ellipsis,
                               textAlign: TextAlign.left,
                               style: AppStyle.txtHeadline)),
                       Expanded(
                           child: Padding(
                               padding: getPadding(top: 15),
                               child:ListView.separated(
                                   physics: BouncingScrollPhysics(),
                                   shrinkWrap: true,
                                   separatorBuilder: (context, index) {
                                     return SizedBox(
                                         height: getVerticalSize(16));
                                   },
                                   itemCount: paymentMethod
                                       .length,
                                   itemBuilder: (context, index) {
                                     PaymentmethodItemModel model =
                                     paymentMethod[index];
                                     return PaymentmethodItemWidget(model,index);
                                   }))),
                       CustomButton(
                           height: getVerticalSize(54),
                           text: "lbl_continue".tr,
                           margin: getMargin(top: 136, bottom: 5),
                           onTap: () {
                            onTapContinue();
                           })
                      ]))))));
 }


 onTapContinue() {
  Get.toNamed(
   AppRoutes.paymentMethod1Screen,
  );
 }


 onTapArrowleft5() {
  Get.back();
 }
}



