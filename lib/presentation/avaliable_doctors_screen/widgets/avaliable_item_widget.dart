import '../../home_page_screen/models/available_doctor_model.dart';
import '../controller/avaliable_doctors_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvaliableItemWidget extends StatelessWidget {
  AvaliableItemWidget(
    this.avaliableItemModelObj, {
    Key? key,
    this.onTapBooknow,
  }) : super(
          key: key,
        );

  AvailableDoctor avaliableItemModelObj;

  var controller = Get.find<AvaliableDoctorsController>();

  VoidCallback? onTapBooknow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 14,
          right: 16,
          bottom: 14,
        ),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: getMargin(
                    bottom: 3,
                  ),
                  color: ColorConstant.gray200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Container(
                    height: getSize(
                      74,
                    ),
                    width: getSize(
                      74,
                    ),
                    decoration: AppDecoration.fillGray200.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          imagePath: avaliableItemModelObj.image,
                          height: getSize(
                            74,
                          ),
                          width: getSize(
                            74,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 21,
                    top: 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        avaliableItemModelObj.name!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtAvenirHeavy16,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: Text(
                          avaliableItemModelObj.category!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtFootnote,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: Text(
                          avaliableItemModelObj.experiance!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtFootnote,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                top: 2,
                bottom: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                      bottom: 2,
                    ),
                    child: Text(
                      avaliableItemModelObj.datatime!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSubheadline,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        onTapBooknow?.call();
                      },
                      child: Container(
                          padding: getPadding(
                              left: 23, top: 2, right: 23, bottom: 2),
                          decoration: AppDecoration.txtOutlineBlack900.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.txtRoundedBorder8),
                          child: Padding(
                            padding: getPadding(top: 3,bottom: 3),
                            child: Container(
                              height: getSize(24),
                              child: Center(
                                child: Text("lbl_book_now".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtAvenirRegular15),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
