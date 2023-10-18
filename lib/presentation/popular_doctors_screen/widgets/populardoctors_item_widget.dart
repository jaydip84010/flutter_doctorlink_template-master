import '../../home_page_screen/models/popular_doctor_model.dart';
import '../controller/popular_doctors_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopulardoctorsItemWidget extends StatelessWidget {
  PopulardoctorsItemWidget(
    this.populardoctorsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PopularDoctor populardoctorsItemModelObj;

  var controller = Get.find<PopularDoctorsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.doctorDetailsScreen,
        );
      },
      child: Container(
        decoration: AppDecoration
            .fillGray50
            .copyWith(
            borderRadius:
            BorderRadiusStyle
                .roundedBorder8),
        child: Padding(
          padding: getPadding(
              top: 8,
              left: 8,
              right: 8),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Padding(
                padding:
                getPadding(
                    bottom:
                    8),
                child: Container(
                    height:
                    getSize(
                        104),
                    width: double
                        .infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(getHorizontalSize(
                            8)),
                        image: DecorationImage(
                            image: AssetImage(populardoctorsItemModelObj
                                .image!),
                            fit: BoxFit
                                .fill)),
                    child: Align(
                        alignment:
                        Alignment
                            .topRight,
                        child:
                        Padding(
                          padding: getPadding(
                              top:
                              8,
                              right:
                              8),
                          child: Container(
                              padding: getPadding(left: 6, right: 6),
                              decoration: AppDecoration.fillWhiteA7007f.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
                              child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgIcStarFill,
                                  height: getSize(16),
                                  width: getSize(16),
                                ),
                                Padding(padding: getPadding(bottom: 0), child: Text(populardoctorsItemModelObj.rating!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtFootnote))
                              ])),
                        ))),
              ),
              Padding(
                  padding: getPadding(
                      top: 12),
                  child: Text(
                      populardoctorsItemModelObj.name!,
                      overflow:
                      TextOverflow
                          .ellipsis,
                      textAlign:
                      TextAlign
                          .left,
                      style: AppStyle
                          .txtAvenirHeavy16)),
              Padding(
                  padding:
                  getPadding(
                      top: 3,
                      bottom:
                      2),
                  child: Text(
                      populardoctorsItemModelObj
                          .category!,
                      overflow:
                      TextOverflow
                          .ellipsis,
                      textAlign:
                      TextAlign
                          .left,
                      style: AppStyle
                          .txtAvenirRegular14))
            ],
          ),
        ),
      ),
    );
  }
}
