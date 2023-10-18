import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../presentation/home_screen_container_screen/controller/custum_bottom_bar_controller.dart';


// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home, selectedicon: ImageConstant.imgHomeSelected,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAppinment,
      title: "lbl_appointments".tr,
      type: BottomBarEnum.Appinment,
        selectedicon: ImageConstant.imgAppinmentSelected
    ),

    BottomMenuModel(
        icon: ImageConstant.imgAppHealth,
        title: "lbl_Health".tr,
        type: BottomBarEnum.Health,
        selectedicon: ImageConstant.imgAppHealthSelected
    ),


    BottomMenuModel(
      icon: ImageConstant.imgInbox,
      title: "lbl_inbox".tr,
      type: BottomBarEnum.Chat,
        selectedicon: ImageConstant.imgInboxSelected
    ),
    BottomMenuModel(
      icon: ImageConstant.imgProfile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
        selectedicon: ImageConstant.imgProfileSelected
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90016,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child:GetBuilder<CustomBottomBarController>(
        init: CustomBottomBarController(),
        builder:(controller) =>  BottomNavigationBar(

          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,

          elevation: 0,
          currentIndex: controller.selectedIndex,
          type: BottomNavigationBarType.fixed,

          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(

              // icon: Center(
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       CustomImageView(
              //         svgPath: bottomMenuList[index].icon,
              //         height: getSize(
              //           24,
              //         ),
              //         width: getSize(
              //           24,
              //         ),
              //         // color: ColorConstant.indigo800,
              //       ),
              //
              //
              //     ],
              //   ),
              // ),


              icon: Center(
                child: CustomImageView(
                          svgPath: bottomMenuList[index].icon,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),

                          // color: ColorConstant.indigo800,
                        ),
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.max
                ,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].selectedicon,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    // color: ColorConstant.indigo800,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtFootnoteGray600.copyWith(
                        color:  ColorConstant.cyan800,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            controller.getIndex(index);
          },
        ),
      ),










    );
  }
}

enum BottomBarEnum {
  Home,
  Appinment,
  Chat,
  Profile,
  Health,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.selectedicon,
    this.title,
    required this.type,
  });

  String icon;
  String selectedicon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
