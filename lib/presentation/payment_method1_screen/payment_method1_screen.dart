import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/payment_method1_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'models/payment_method1_model.dart';
import 'models/payment_methods_data.dart';





class PaymentMethod1Screen extends StatefulWidget {
  const PaymentMethod1Screen({Key? key}) : super(key: key);

  @override
  State<PaymentMethod1Screen> createState() => _PaymentMethod1ScreenState();
}

class _PaymentMethod1ScreenState extends State<PaymentMethod1Screen> {
  PaymentMethod1Controller paymentMethod1ScreenController = Get.put(PaymentMethod1Controller());
 List<PaymentMethod1Model> methods = PaymentMethods.getPaymentMethods();
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
                   onTapArrowleft6();
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_payment_method".tr),
              styleType: Style.bgFillWhiteA700),
          body: GetBuilder<PaymentMethod1Controller>(
            init: PaymentMethod1Controller(),
            builder:(controller) =>  SizedBox(
                width: double.maxFinite,
                child: Container(
                    width: double.maxFinite,
                    margin: getMargin(top: 8),
                    padding:
                    getPadding(left: 16, top: 15, right: 16, bottom: 15),
                    decoration: AppDecoration.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Padding(
                             padding: getPadding(left: 1),
                             child: Text("lbl_payment_method".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtHeadline)),

                         ListView.builder(primary: false,shrinkWrap: true,itemCount: methods.length,itemBuilder: (context, index) {
                           PaymentMethod1Model data = methods[index];
                           return  GestureDetector(
                             onTap: (){
                               controller.setCurrentPaymentMethod(index);
                             },
                             child: Container(
                                 margin: getMargin(top: 16),
                                 padding: getPadding(
                                     left: 16, top: 20, right: 16, bottom: 20),
                                 decoration: controller.currentPaymentMethos==index?AppDecoration.outlineCyan8001.copyWith(
                                     borderRadius:
                                     BorderRadiusStyle.roundedBorder16):
                                 AppDecoration.fillGray50.copyWith(
                                     borderRadius:
                                     BorderRadiusStyle.roundedBorder16),
                                 child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Card(
                                           clipBehavior: Clip.antiAlias,
                                           elevation: 0,
                                           margin: getMargin(left: 4),
                                           color: ColorConstant.whiteA700,
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadiusStyle
                                                   .roundedBorder16),
                                           child: Container(
                                               height: getSize(36),
                                               width: getSize(36),
                                               padding: getPadding(all: 6),
                                               decoration: AppDecoration.white
                                                   .copyWith(
                                                   borderRadius:
                                                   BorderRadiusStyle
                                                       .roundedBorder16),
                                               child: Stack(children: [
                                                 CustomImageView(
                                                     svgPath:data.icon,
                                                     height: getSize(24),
                                                     width: getSize(24),
                                                     alignment: Alignment.center)
                                               ]))),
                                       Padding(
                                           padding: getPadding(
                                               left: 12, top: 3, bottom: 3),
                                           child: Text(data.title!,
                                               overflow: TextOverflow.ellipsis,
                                               textAlign: TextAlign.left,
                                               style: AppStyle.txtHeadline)),
                                       Spacer(),
                                       CustomImageView(
                                           svgPath: controller.currentPaymentMethos==index? ImageConstant.imgRadioButtonSelected:ImageConstant.imgRadioButtonunSelected,
                                           height: getSize(24),
                                           width: getSize(24),
                                           margin: getMargin(top: 6, bottom: 6))
                                     ])),
                           );
                         },),
                         SizedBox(height: getVerticalSize(24),),
                         Center(
                           child: GestureDetector(
                             onTap: (){
                               onTapAddnewcard();
                             },
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 CustomImageView(
                                     svgPath: ImageConstant.imgIcAdd),
                                 Text("lbl_add_new_card".tr,
                                 style: AppStyle.txtBody,),

                               ],
                             ),
                           ),
                         ),
                         // CustomButton(
                         //     width: getHorizontalSize(133),
                         //     text: "lbl_add_new_card".tr,
                         //     margin: getMargin(top: 22),
                         //     shape: ButtonShape.Square,
                         //     fontStyle: ButtonFontStyle.AvenirRegular16,
                         //     prefixWidget: Container(
                         //         margin: getMargin(right: 8),
                         //         child: CustomImageView(
                         //             svgPath: ImageConstant.imgIcAdd)),
                         //     onTap: () {
                         //      onTapAddnewcard();
                         //     },
                         //     alignment: Alignment.center),
                         Spacer(),
                         CustomButton(
                             height: getVerticalSize(54),
                             text: "lbl_continue".tr,
                             margin: getMargin(bottom: 24),
                             onTap: () {
                              onTapContinue();
                             })
                        ]))),
          ))));
 }


 onTapAddnewcard() {
  Get.toNamed(
   AppRoutes.addACardOneScreen,
  );
 }

 onTapContinue() {
  Get.toNamed(
   AppRoutes.bokkingSuccessScreen,
  );
 }

 onTapArrowleft6() {
  Get.back();
 }
}





