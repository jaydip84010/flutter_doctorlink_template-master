import '../controller/book_appointment_controller.dart';
import '../models/book_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookItemWidget extends StatelessWidget {
  BookItemWidget(
    this.bookItemModelObj,this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  BookItemModel bookItemModelObj;
  int index;
  BookAppointmentController bookAppointmentController =Get.put(BookAppointmentController());
  // var controller = Get.find<BookAppointmentController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookAppointmentController>(
      init: BookAppointmentController(),
      builder: (controller) => GestureDetector(
        onTap: (){
          controller.setCurrentSlot(index);
        },
        child: Container(
          decoration: controller.currentSlot==index?AppDecoration.outlineCyan8001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16):AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bookItemModelObj.date!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtAvenirHeavy16,
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Text(
                bookItemModelObj.slot!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtFootnote,
              ),
            ),
          ],
        ),),
      ),
    );

  }
}
