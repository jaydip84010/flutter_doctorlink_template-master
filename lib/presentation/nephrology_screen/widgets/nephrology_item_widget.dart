import '../controller/nephrology_controller.dart';
import '../models/nephrology_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NephrologyItemWidget extends StatelessWidget {
  NephrologyItemWidget(
    this.nephrologyItemModelObj, {
    Key? key,
    this.onTapPopulardoctor,
  }) : super(
          key: key,
        );

  NephrologyItemModel nephrologyItemModelObj;

  var controller = Get.find<NephrologyController>();

  VoidCallback? onTapPopulardoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapPopulardoctor?.call();
      },
      child: Container(
        padding: getPadding(
          all: 8,
        ),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath:nephrologyItemModelObj.image,
              height: getVerticalSize(
                82,
              ),
              width: getHorizontalSize(
                84,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  8,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 16,
                top: 9,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    nephrologyItemModelObj.name!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtHeadline,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      nephrologyItemModelObj.category!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBody,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomImageView(
              svgPath: ImageConstant.imgIcStarFill,
              height: getSize(
                20,
              ),
              width: getSize(
                20,
              ),
              margin: getMargin(
                top: 53,
                bottom: 9,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 6,
                top: 49,
                right: 8,
                bottom: 7,
              ),
              child: Text(
                nephrologyItemModelObj.rating!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
