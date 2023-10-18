import '../../home_page_screen/models/specialist_category_model.dart';
import '../../nephrology_screen/nephrology_screen.dart';
import '../../neurologist_screen/neurologist_screen.dart';
import '../../orthopedic_screen/orthopedic_screen.dart';
import '../../pulmonology_screen/pulmonology_screen.dart';
import '../controller/specialist_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpecialistItemWidget extends StatelessWidget {
  SpecialistItemWidget(
    this.specialistItemModelObj,
    this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  SpecialistCategory specialistItemModelObj;
  int index;
  SpecialistController specialistController = Get.put(SpecialistController());

  // var controller = Get.find<SpecialistController>();
  List classes = [
    NeurologistScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    NephrologyScreen(),
    PulmonologyScreen(),
    PulmonologyScreen(),
    PulmonologyScreen(),
    PulmonologyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialistController>(
      init: SpecialistController(),
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.setCurrentIndex(index);
          Get.to(classes[index]);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),

              child: Container(
                height: getSize(
                  102,
                ),
                width: getSize(
                  102,
                ),
                padding: getPadding(
                  all: 20,
                ),
                child: Stack(
                  children: [
                    CustomImageView(
                      svgPath: specialistItemModelObj.icon,
                      height: getSize(
                        80,
                      ),
                      width: getSize(
                        80,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 9,
              ),
              child: Text(
                specialistItemModelObj.title!,
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
