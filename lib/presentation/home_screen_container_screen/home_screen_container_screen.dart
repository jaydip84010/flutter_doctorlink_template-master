import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/health/home_sceens/health_home_page.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../chat_screen/chat_screen.dart';
import '../home_page_screen/home_page_screen.dart';
import '../my_appoiments_screen/my_appoiments_screen.dart';
import '../profille_screen/profille_screen.dart';
import 'controller/custum_bottom_bar_controller.dart';





class HomeScreenContainerScreen extends StatefulWidget {
  const HomeScreenContainerScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreenContainerScreen> createState() => _HomeScreenContainerScreenState();
}

class _HomeScreenContainerScreenState extends State<HomeScreenContainerScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }




  back(CustomBottomBarController controller){
    if (controller.selectedIndex == 0) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              insetPadding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.zero,
              content: Container(
                  width: getHorizontalSize(396),
                  padding:
                  getPadding(left: 0, top: 38, right: 0, bottom: 38),
                  decoration: AppDecoration.white.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you sure you want to exit?",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtHeadline,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 30,
                          top: 28,
                          right: 30,
                          bottom: 2,
                        ),
                        child: Row(
                          children: [

                            Expanded(
                              child: CustomButton(
                                height: getVerticalSize(
                                  46,
                                ),
                                text: "No",
                                margin: getMargin(
                                  right: 10,
                                ),
                                onTap: (){
                                  Get.back();
                                },
                                variant: ButtonVariant.OutlineCyan800,
                                padding: ButtonPadding.PaddingAll9,
                                fontStyle:
                                ButtonFontStyle.AvenirBlack18Cyan800,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Expanded(
                              child: CustomButton(
                                onTap: (){
                                  if (controller.selectedIndex == 0) {
                                    closeApp();
                                  } else {
                                    controller.getIndex(0);
                                    Get.back();
                                  }
                                },
                                height: getVerticalSize(
                                  46,
                                ),
                                text: "Yes",
                                margin: getMargin(
                                  left: 10,
                                ),
                                fontStyle: ButtonFontStyle.SFProDisplayBold18,
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  )));
        },
      );
    } else {
      controller.getIndex(0);
      // Get.back();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          back(controller);
          return false;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                backgroundColor: ColorConstant.gray50,
                body: getScreen(controller),
                bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
                  Get.toNamed(getCurrentRoute(type), id: 1);
                }))),
      ),
    );
  } List<Widget> screen=[];

  getScreen(CustomBottomBarController controller ){

    if(screen.isEmpty) {
       screen = [
        HomePageScreen(),
        MyAppoimentsScreen(),
        HealthHomePageScreen(function: () {
          back(controller);
        }),
        ChatScreen(),
        ProfilleScreen()
      ];
    }
    return screen[controller.selectedIndex]
;  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageScreen;
      case BottomBarEnum.Appinment:
        return AppRoutes.myAppoimentsScreen;

      case BottomBarEnum.Health:
        return AppRoutes.healthHomePage;
      case BottomBarEnum.Chat:
        return AppRoutes.chat1Screen;
      case BottomBarEnum.Profile:
        return AppRoutes.profilleScreen;
      default:
        return "/";
    }
  }
}




