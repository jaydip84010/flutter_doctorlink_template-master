import '../controller/my_appoiments_controller.dart';
import '../models/myappoiments_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyappoimentsItemWidget extends StatelessWidget {
  MyappoimentsItemWidget(
    this.myappoimentsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MyappoimentsItemModel myappoimentsItemModelObj;

  var controller = Get.find<MyAppoimentsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.appoimentsDetailsScreen);
      },
      child: Container(
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Padding(
          padding: getPadding(all: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               children: [
                 CustomImageView(
                   imagePath:myappoimentsItemModelObj.image,
                   height: getSize(
                     96,
                   ),
                   width: getSize(
                     96,
                   ),
                   radius: BorderRadius.circular(
                     getHorizontalSize(
                       16,
                     ),
                   ),
                 ),
                 SizedBox(width: getHorizontalSize(8),),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       myappoimentsItemModelObj.name!,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: AppStyle.txtSubheadline,
                     ),
                     SizedBox(height: getVerticalSize(8),),
                     Text(
                       myappoimentsItemModelObj.category!,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: AppStyle.txtFootnote,
                     ),
                     SizedBox(height: getVerticalSize(8),),
                     Text(
                       myappoimentsItemModelObj.price!,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: AppStyle.txtBody,
                     ),
                   ],
                 )
               ],
             ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    myappoimentsItemModelObj.date!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtAvenirRegular14Gray600.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.14,
                      ),
                    ),
                  ),
                  SizedBox(height: getVerticalSize(23),),
                  Container(
                    height: getSize(32),
                    width: getSize(102),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getHorizontalSize(16),),
                      border: Border.all(color: myappoimentsItemModelObj.status!.toLowerCase() == "cancelled"?ColorConstant.red:
                      myappoimentsItemModelObj.status!.toLowerCase() == "reschedule"?ColorConstant.greenA700:ColorConstant.amber700)
                    ),
                    child: Center(
                      child: Text(myappoimentsItemModelObj.status!,style: TextStyle(
                        color:myappoimentsItemModelObj.status!.toLowerCase() == "cancelled"?ColorConstant.red:
                        myappoimentsItemModelObj.status!.toLowerCase() == "reschedule"?ColorConstant.greenA700:ColorConstant.amber700,
                        fontSize: getFontSize(
                          14,
                        ),
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w800,
                      ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );










  }
}
