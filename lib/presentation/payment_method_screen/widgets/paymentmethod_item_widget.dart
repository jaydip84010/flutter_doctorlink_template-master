import '../controller/payment_method_controller.dart';
import '../models/paymentmethod_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentmethodItemWidget extends StatelessWidget {
  PaymentmethodItemWidget(
    this.paymentmethodItemModelObj,this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  PaymentmethodItemModel paymentmethodItemModelObj;
  int index;
  PaymentMethodController paymentMethodController = Get.put(PaymentMethodController());
  var controller = Get.find<PaymentMethodController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      init: PaymentMethodController(),
      builder:(controller) =>  GestureDetector(
        onTap: (){
          controller.setCurrentPackege(index);
        },
        child: Container(
          padding: getPadding(
            left: 16,
            top: 14,
            right: 16,
            bottom: 14,
          ),
          decoration: controller.currentPackege==index?AppDecoration.outlineCyan8001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ):AppDecoration.fillGray50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 54,
                width: 54,
                margin: getMargin(
                  top: 1,
                ),
                variant: IconButtonVariant.FillTeal50,
                shape: IconButtonShape.CircleBorder27,
                padding: IconButtonPadding.PaddingAll15,
                child: CustomImageView(
                  svgPath: paymentmethodItemModelObj.icon,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 16,
                  top: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      paymentmethodItemModelObj.title!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtHeadline,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 2,
                      ),
                      child: Text(
                        paymentmethodItemModelObj.subtitle!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtFootnoteGray600,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    paymentmethodItemModelObj.price!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtAvenirHeavy16,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 8,
                    ),
                    child: Text(
                      paymentmethodItemModelObj.minit!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtFootnoteGray600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
