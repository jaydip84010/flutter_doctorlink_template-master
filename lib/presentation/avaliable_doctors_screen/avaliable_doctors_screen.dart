import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../avaliable_doctors_screen/widgets/avaliable_item_widget.dart';
import '../filter_screen/filter_screen.dart';
import '../home_page_screen/models/available_doctor_model.dart';
import '../home_page_screen/models/home_page_model.dart';
import 'controller/avaliable_doctors_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/app_bar/appbar_image.dart';
import 'package:doctorapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:doctorapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';





class AvaliableDoctorsScreen extends StatefulWidget {
  const AvaliableDoctorsScreen({Key? key}) : super(key: key);

  @override
  State<AvaliableDoctorsScreen> createState() => _AvaliableDoctorsScreenState();
}

class _AvaliableDoctorsScreenState extends State<AvaliableDoctorsScreen> {
  AvaliableDoctorsController controller = Get.put(AvaliableDoctorsController());
  List<AvailableDoctor> availableDoctor = HomePageModel.getAvailableDoctor();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
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
                      onTapArrowleft9();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "msg_available_doctors".tr),
                actions: [
                  AppbarImage(
                    onTap: (){

                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(getHorizontalSize(32)),
                                topRight:
                                Radius.circular(getHorizontalSize(32)))),
                        builder: (context) {
                          return FilterScreen();
                        },
                      );

                    },
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettingsBlack900,
                      margin:
                      getMargin(left: 16, top: 29, right: 16, bottom: 26))
                ],
                styleType: Style.bgFillWhiteA700),
            body: Container(
                margin: getMargin(top: 8),
                decoration: AppDecoration.white,
                child:  ListView.separated(
                  padding: getPadding(left: 16,right: 16,top: 12,bottom: 12),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: availableDoctor.length,
                    itemBuilder: (context, index) {
                      AvailableDoctor model = availableDoctor[index];
                      return AvaliableItemWidget(model, onTapBooknow: () {
                        onTapBooknow();
                      });
                    })))));
  }

  onTapBooknow() {
    Get.toNamed(AppRoutes.bookAppointmentScreen);
  }


  onTapArrowleft9() {
    Get.back();
  }
}






