import '../controller/onboarding_one_controller.dart';
import '../models/slidermanageyou_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlidermanageyouItemWidget extends StatelessWidget {
  SlidermanageyouItemWidget(
    this.slidermanageyouItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SlidermanageyouItemModel slidermanageyouItemModelObj;

  var controller = Get.find<OnboardingOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: getHorizontalSize(
            348,
          ),
          child: Text(
            "msg_manage_your_income".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtAvenirBlack28,
          ),
        ),
        Container(
          width: getHorizontalSize(
            346,
          ),
          margin: getMargin(
            top: 13,
          ),
          child: Text(
            "msg_we_keep_accurate".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtBody,
          ),
        ),
      ],
    );
  }
}
