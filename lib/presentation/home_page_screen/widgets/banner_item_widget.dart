import '../controller/home_page_controller.dart';
import '../models/banner_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerItemWidget extends StatelessWidget {
  BannerItemWidget(
    this.bannerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BannerItemModel bannerItemModelObj;

  var controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return




      GestureDetector(
        onTap: (){
          Get.toNamed(AppRoutes.bookAppointmentScreen);
        },
        child: Padding(
          padding: getPadding(left: 8,right: 8),
          child: Container(
            height: getSize(134),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(bannerItemModelObj.image!),fit: BoxFit.fill)
            ),
            child: Padding(
              padding: getPadding(right: 95,left: 16,top: 19,bottom: 19),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(bannerItemModelObj.title!,
                    style: AppStyle.txtHeadlineblack800,),
                  ),
                  SizedBox(width: getHorizontalSize(3),),
                  Row(
                    children: [
                      Text("Book Now",style: AppStyle.txtAvenirHeavy15,),
                      CustomImageView(svgPath: ImageConstant.imgArrowIcon,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
