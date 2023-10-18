import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/onboarding_one_controller.dart';
import 'models/onboarding_one_model.dart';
import 'models/slidermanageyou_item_model.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  List<SlidermanageyouItemModel> onboarding =
      OnboardingOneModel.getOnboardingData();
  PageController pageController = PageController();
  OnboardingOneController controller = Get.put(OnboardingOneController());
  List dieses = [
    'DAIBETES',
    'OBESITY',
    'STROKE',
    'MISCARRIAGE',
    'ARTERY DISEASE',
    'MORTALITY'
  ];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFFdde6e8),
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: ColorfulSafeArea(
            child: Scaffold(
                body: GetBuilder<OnboardingOneController>(
          init: OnboardingOneController(),
          builder: (controller) => Stack(
            children: [
              Container(
                child: PageView.builder(
                  onPageChanged: (value) {
                    controller.setCurrentPage(value);
                  },
                  controller: pageController,
                  itemCount: onboarding.length,
                  itemBuilder: (context, index) {
                    SlidermanageyouItemModel data = onboarding[index];
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  data.image!,
                                ),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: getPadding(
                              top: controller.currentPage ==
                                      onboarding.length - 1
                                  ? 450
                                  : 491),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Visibility(
                                    visible: controller.currentPage ==
                                            onboarding.length - 1
                                        ? false
                                        : true,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: getHorizontalSize(
                                            385,
                                          ),
                                          child: Text(
                                            "${onboarding[index].title}",
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtBodyWhiteA700,
                                          ),
                                        ),
                                        Container(
                                          width: getHorizontalSize(
                                            303,
                                          ),
                                          margin: getMargin(
                                            top: 13,
                                          ),
                                          child: Text(
                                            "",
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtBody,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                        ),
                                      ],
                                    )),
                              ),
                              Visibility(
                                  visible: controller.currentPage ==
                                          onboarding.length - 1
                                      ? true
                                      : false,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/3.10,
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    margin: EdgeInsets.only(top: 5),
                                    child: GridView.builder(
                                      physics: ScrollPhysics(parent: null),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 120 / 40,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 0.0,
                                      ),
                                      itemCount: dieses.length,
                                      itemBuilder: (context, index) {
                                        return Stack(children: [
                                          Container(
                                            child: Image.asset(
                                              "assets/images/AAWI-Resources_Button 1.png",
                                              height: 60,
                                              width: 200,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, top: 15),
                                              child: Text(
                                                dieses[index],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'RobotoCondensed'),
                                              ))
                                        ]);
                                      },
                                    ),
                                  )),
                              SizedBox(height: controller.currentPage == 0 || controller.currentPage == 1 || controller.currentPage == 2?40:0,),
                              Padding(
                                padding: getPadding(bottom: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                        height: getVerticalSize(54),
                                        variant: controller.currentPage ==
                                                onboarding.length - 1
                                            ? ButtonVariant.FillCyan800
                                            : ButtonVariant.FillWhiteA700,
                                        width: 350,
                                        text: controller.currentPage == 0
                                            ? "Get Started"
                                            : controller.currentPage ==
                                                    onboarding.length - 1
                                                ? "Launch Your Free Health Guide"
                                                : "lbl_next".tr,
                                        fontStyle: controller.currentPage ==
                                                onboarding.length - 1
                                            ? ButtonFontStyle.SFProDisplayBold18
                                            : ButtonFontStyle.AvenirBlack20,
                                        margin: getMargin(
                                            left: 20, top: 48, right: 20),
                                        onTap: controller.currentPage ==
                                                onboarding.length - 1
                                            ? () {
                                                PrefUtils.setIsIntro(false);
                                                Get.toNamed(
                                                  AppRoutes.signInScreen,
                                                );
                                              }
                                            : () {
                                                pageController.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.bounceIn);
                                              }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ))));
  }

  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingTwoScreen,
    );
  }

  onTapTxtSkip() {
    PrefUtils.setIsIntro(false);
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }
}
