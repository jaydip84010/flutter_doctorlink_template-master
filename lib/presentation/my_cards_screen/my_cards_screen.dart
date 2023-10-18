import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../payment_method1_screen/models/payment_method1_model.dart';
import '../payment_method1_screen/models/payment_methods_data.dart';
import 'controller/my_cards_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  MyCardsController controller = Get.put(MyCardsController());
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
                          onTapArrowleft19();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_my_card".tr),
                    styleType: Style.bgFillWhiteA700),
                body:

                methods.isNotEmpty?

                Padding(
                  padding: getPadding(top: 10),
                  child: Container(
                   decoration: AppDecoration.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: getVerticalSize(16),),
                        Padding(
                          padding: getPadding(left: 16,right: 16),
                          child: Text("My Payment method",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtHeadline),
                        ),
                        ListView.builder(padding: getPadding(left: 16,right: 16,top:8),itemCount: methods.length,primary: false,shrinkWrap: true,itemBuilder: (context, index) {
                          PaymentMethod1Model data = methods[index];
                          return Padding(
                            padding: getPadding(top: 8,bottom: 8),
                            child: Container(
                              decoration: AppDecoration.fillGray50.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder16,
                              ),
                              child: Padding(
                                padding: getPadding(all: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: getSize(36),
                                      width: getSize(36),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstant.whiteA700
                                      ),
                                      child: Padding(
                                        padding: getPadding(all: 6),
                                        child: CustomImageView(
                                          svgPath: data.icon,

                                        ),
                                      ),
                                    ),
                                    SizedBox(width: getHorizontalSize(12),),
                                    Text(data.title!,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },),
                        Spacer(),
                        Padding(
                          padding: getPadding(left: 16,right: 16),
                          child: CustomButton(
                            onTap: (){
                              Get.toNamed(AppRoutes.addACardOneScreen);
                            },
                              height: getVerticalSize(54),
                              text: "lbl_add_card".tr,
                              margin: getMargin(bottom: 24)),
                        )
                      ],
                    ),
                  ),
                ):
                SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        width: double.maxFinite,
                        margin: getMargin(top: 10),
                        padding:
                        getPadding(left: 69, top: 162, right: 69, bottom: 162),
                        decoration: AppDecoration.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgCard140x140,
                                  height: getSize(140),
                                  width: getSize(140)),
                              Padding(
                                  padding: getPadding(top: 27),
                                  child: Text("lbl_no_card_yet".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAvenirBlack28)),
                              Padding(
                                  padding: getPadding(top: 10),
                                  child: Text("msg_it_is_a_long_established".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)),
                              CustomButton(
                                onTap: (){
                                  Get.toNamed(AppRoutes.addACardOneScreen);
                                },
                                  height: getVerticalSize(54),
                                  width: getHorizontalSize(180),
                                  text: "lbl_add_card".tr,
                                  margin: getMargin(top: 29, bottom: 5))
                            ])))
            )));
  }
  onTapArrowleft19() {
    Get.back();
  }
}



