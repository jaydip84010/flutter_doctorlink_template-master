import 'package:doctorapp/health/gender_selection_screen.dart';
import 'package:doctorapp/health/height_selection_screen.dart';
import 'package:doctorapp/health/utils/PrefData.dart';
import 'package:doctorapp/health/weight_selection_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../health/data/DataFile.dart';
import '../../health/home_sceens/health_calculator_screen.dart';
import '../../health/home_sceens/health_home_page.dart';
import '../../health/model/RowItem.dart';
import '../../health/model/home_screen_data_model.dart';
import '../../health/utils/ConstantData.dart';
import '../../health/utils/ConstantWidget.dart';
import '../home_page_screen/widgets/banner_item_widget.dart';
import '../neurologist_screen/neurologist_screen.dart';
import '../orthopedic_screen/orthopedic_screen.dart';
import 'controller/home_page_controller.dart';
import 'models/available_doctor_model.dart';
import 'models/banner_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'models/home_page_model.dart';
import 'models/popular_doctor_model.dart';
import 'models/specialist_category_model.dart';

class HomePageScreen extends StatefulWidget {

  const HomePageScreen({Key? key,}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageController controller = Get.put(HomePageController());
  List<BannerItemModel> slider = HomePageModel.bannerItemList();
  List<PopularDoctor> populerDoctor = HomePageModel.getPopularDoctor();
  List<SpecialistCategory> specialistCategory =
      HomePageModel.getSpecialistCategory();

  List<HomeScreenData> homeData = DataFile.getHomeData();


  List<RowItem> rowItemList = [];



  List<AvailableDoctor> availableDoctor = HomePageModel.getAvailableDoctor();
  List classes = [
    NeurologistScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
    OrthopedicScreen(),
  ];

  _getIsFirst() async {
    // bool isGender = await PrefData.getGenderScreen();
    // bool isHeight = await PrefData.getHeightScreen();
    // bool isWeight = await PrefData.getWeightScreen();
    //
    // if (isGender) {
    //   Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.scale,
    //         child: GenderSelectionScreen(),
    //         inheritTheme: true,
    //         alignment: Alignment.bottomCenter,
    //         ctx: context),
    //   );
    // } else if (isHeight) {
    //   Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.scale,
    //         child: HeightSelectionScreen(),
    //         inheritTheme: true,
    //         alignment: Alignment.bottomCenter,
    //         ctx: context),
    //   );
    // } else if (isWeight) {
    //   Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.scale,
    //         child: WeightSelectionScreen(),
    //         inheritTheme: true,
    //         alignment: Alignment.bottomCenter,
    //         ctx: context),
    //   );
    // } else {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            child: HealthHomePageScreen(),
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            ctx: context),
      );
    // }
  }

  @override
  Widget build(BuildContext context) {
    rowItemList = DataFile.getCategoryModel(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.maxFinite,
                      child: Container(
                          padding: getPadding(top: 0, bottom: 0),
                          decoration: AppDecoration.white,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: getPadding(left: 16, right: 16, top: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("lbl_hi_ronald".tr,
                                                overflow: TextOverflow.ellipsis,
                                                //     onTap: () {
                                                //       _getIsFirst();
                                                //     },
                                                //     height: 40,
                                                //     width: 40,
                                                //     margin: getMargin(
                                                //         left: 16,
                                                //         top: 6,
                                                //         right: 0,
                                                //         bottom: 9),
                                                //     child: CustomImageView(
                                                //       iconData: Icons.health_and_safety,
                                                //     )),
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtAvenirBlack20),
                                            Text("lbl_russia".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBody)
                                          ],
                                        ),
                                      ),
                                      // CustomIconButton(
                                      CustomIconButton(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.notificationsScreen);
                                          },
                                          height: 40,
                                          width: 40,
                                          margin: getMargin(
                                              left: 16,
                                              top: 6,
                                              right: 0,
                                              bottom: 9),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgIcnotification))
                                    ],
                                  ),
                                ),
                              ]))),
                  Expanded(
                      child: SingleChildScrollView(
                          padding: getPadding(top: 0),
                          child: Padding(
                              padding: getPadding(bottom: 5),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: AppDecoration.white,
                                        child: Padding(
                                          padding: getPadding(
                                              left: 0, top: 19, bottom: 34),
                                          child: Column(
                                            children: [
                                              CarouselSlider.builder(
                                                  options: CarouselOptions(
                                                      height: getVerticalSize(140),
                                                      initialPage: 1,
                                                      autoPlay: true,
                                                      viewportFraction: 0.85,
                                                      enableInfiniteScroll: false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      onPageChanged:
                                                          (index, reason) {
                                                        controller.sliderIndex
                                                            .value = index;
                                                      }),
                                                  itemCount: slider.length,
                                                  itemBuilder:
                                                      (context, index, realIndex) {
                                                    BannerItemModel model =
                                                        slider[index];
                                                    return BannerItemWidget(model);
                                                  }),
                                              Obx(
                                                () => Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: List.generate(
                                                        slider.length, (index) {
                                                      return AnimatedContainer(
                                                        margin: getMargin(
                                                            left: 4,
                                                            top: 20,
                                                            right: 4),
                                                        duration: const Duration(
                                                            milliseconds: 300),
                                                        height: getVerticalSize(6),
                                                        width: getHorizontalSize(
                                                            index ==
                                                                    controller
                                                                        .sliderIndex
                                                                        .value
                                                                ? 18
                                                                : 6),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        3.5)),
                                                            color: (index ==
                                                                    controller
                                                                        .sliderIndex
                                                                        .value)
                                                                ? ColorConstant
                                                                    .black900
                                                                : ColorConstant
                                                                    .black900
                                                                    .withOpacity(
                                                                        0.10)),
                                                      );
                                                    })),
                                              ),
                                            ],
                                          ),
                                        )),

                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    SizedBox(
                                        width: double.maxFinite,
                                        child: Container(
                                            padding: getPadding(
                                                left: 16,
                                                top: 15,
                                                right: 16,
                                                bottom: 15),
                                            decoration: AppDecoration.white,
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Health Calculator',
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: AppStyle
                                                                .txtHeadline),
                                                        GestureDetector(
                                                            onTap: () {

                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(

                                                                    builder: (context) => HealthCalculatorScreen(),
                                                                  ));
                                                            },
                                                            child: Padding(
                                                                padding: getPadding(
                                                                    top: 2,
                                                                    bottom: 4),
                                                                child: Text(
                                                                    "lbl_view_all"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: AppStyle
                                                                        .txtAvenirRegular14)))
                                                      ]),
                                                  GridView.builder(
                                                    padding: getPadding(top: 16),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount: homeData
                                                        .length >
                                                        4
                                                        ? 4
                                                        : homeData.length,
                                                    gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisExtent:
                                                        100.h,
                                                        crossAxisCount: 4,
                                                        mainAxisSpacing:
                                                        getHorizontalSize(
                                                            12),
                                                        crossAxisSpacing:
                                                        getHorizontalSize(
                                                            16)),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                        int index) {
                                                          HomeScreenData data = homeData[index];


                                                      return  GestureDetector(
                                                        onTap: () async {


                                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                            return AppRoutes.fromKey("/${rowItemList[index].pageName}", rowItemList[index]);
                                                          },));

                                                        },

                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment.bottomCenter,
                                                              child: Container(
                                                                height: 75.h,

                                                                child: Container(
                                                                    alignment: Alignment.bottomCenter,
                                                                    width: 166.h,
                                                                    child: getCustomFont(data.title, 12.sp,
                                                                        ConstantData.textColor, 1,
                                                                        fontWeight: FontWeight.w700,
                                                                        textAlign: TextAlign.center))
                                                                    .paddingOnly(
                                                                    bottom: 5.h, left: 8.h, right: 8.h),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: Alignment.topCenter,
                                                              child: Container(
                                                                height: 65.h,
                                                                width: 65.h,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight: Radius.circular(50.h),
                                                                      topLeft: Radius.circular(50.h),
                                                                      bottomLeft: Radius.circular(10.h),
                                                                      bottomRight: Radius.circular(10.h)),

                                                                ),
                                                                child: getSvgImage(data.icon).paddingAll(5.h),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ]))),


                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    SizedBox(
                                        width: double.maxFinite,
                                        child: Container(
                                            padding: getPadding(
                                                left: 16,
                                                top: 15,
                                                right: 16,
                                                bottom: 15),
                                            decoration: AppDecoration.white,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text("lbl_specialist".tr,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtHeadline),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapTxtViewall();
                                                            },
                                                            child: Padding(
                                                                padding: getPadding(
                                                                    top: 2,
                                                                    bottom: 4),
                                                                child: Text(
                                                                    "lbl_view_all"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAvenirRegular14)))
                                                      ]),
                                                  GridView.builder(
                                                    padding: getPadding(top: 16),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount: specialistCategory
                                                                .length >
                                                            4
                                                        ? 4
                                                        : specialistCategory.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            mainAxisExtent:
                                                                getVerticalSize(
                                                                    120),
                                                            crossAxisCount: 4,
                                                            mainAxisSpacing:
                                                                getHorizontalSize(
                                                                    12),
                                                            crossAxisSpacing:
                                                                getHorizontalSize(
                                                                    16)),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      SpecialistCategory data =
                                                          specialistCategory[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Get.to(classes[index]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: getSize(87),
                                                              width: getSize(87),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                     ),
                                                              child:
                                                                  CustomImageView(
                                                                margin: getMargin(
                                                                    all: 15),
                                                                svgPath: data.icon,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: getPadding(
                                                                    top: 0),
                                                                child: Text(
                                                                    data.title!,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtBody))
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ]))),
                                    SizedBox(
                                        width: double.maxFinite,
                                        child: Container(
                                            margin: getMargin(top: 8),
                                            padding: getPadding(
                                                left: 16,
                                                top: 15,
                                                right: 16,
                                                bottom: 15),
                                            decoration: AppDecoration.white,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                            "lbl_popular_doctors"
                                                                .tr,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtHeadline),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapTxtViewallone();
                                                            },
                                                            child: Padding(
                                                                padding: getPadding(
                                                                    top: 2,
                                                                    bottom: 4),
                                                                child: Text(
                                                                    "lbl_view_all"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAvenirRegular14)))
                                                      ]),
                                                  GridView.builder(
                                                    padding: getPadding(top: 16),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount: specialistCategory
                                                                .length <
                                                            2
                                                        ? specialistCategory.length
                                                        : 2,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            mainAxisExtent:
                                                                getVerticalSize(
                                                                    186),
                                                            crossAxisCount: 2,
                                                            mainAxisSpacing:
                                                                getHorizontalSize(
                                                                    12),
                                                            crossAxisSpacing:
                                                                getHorizontalSize(
                                                                    16)),
                                                    itemBuilder: (context, index) {
                                                      PopularDoctor data =
                                                          populerDoctor[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          onTapPopulardoctor2();
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
                                                                              image: AssetImage(data
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
                                                                                  Padding(padding: getPadding(bottom: 0), child: Text(data.rating!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtFootnote))
                                                                                ])),
                                                                          ))),
                                                                ),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        top: 12),
                                                                    child: Text(
                                                                        data.name!,
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
                                                                        data
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
                                                    },
                                                  ),
                                                ]))),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.bookAppointmentScreen);
                                      },
                                      child: Container(
                                          width: double.maxFinite,
                                          margin: getMargin(top: 8),
                                          decoration: AppDecoration.fillIndigo50,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        left: 16,
                                                        top: 18,
                                                        bottom: 16),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  getHorizontalSize(
                                                                      188),
                                                              child: Text(
                                                                  "msg_take_care_of_mental"
                                                                      .tr,
                                                                  maxLines: null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBody)),
                                                          Padding(
                                                              padding: getPadding(
                                                                  top: 9),
                                                              child: Row(children: [
                                                                Text(
                                                                    "lbl_book_now"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAvenirHeavy15),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowrightBlack900,
                                                                    height:
                                                                        getSize(24),
                                                                    width:
                                                                        getSize(24),
                                                                    margin:
                                                                        getMargin(
                                                                            left:
                                                                                11))
                                                              ]))
                                                        ])),
                                                SizedBox(
                                                    height: getVerticalSize(120),
                                                    width: getHorizontalSize(191),
                                                    child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath: ImageConstant
                                                                  .imgImageprofessio,
                                                              height:
                                                                  getVerticalSize(
                                                                      114),
                                                              width:
                                                                  getHorizontalSize(
                                                                      151),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              margin: getMargin(
                                                                  left: 17)),
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgEllipse237,
                                                              height:
                                                                  getVerticalSize(
                                                                      120),
                                                              width:
                                                                  getHorizontalSize(
                                                                      191),
                                                              alignment:
                                                                  Alignment.center)
                                                        ]))
                                              ])),
                                    ),
                                    Container(
                                        height: getVerticalSize(216),
                                        width: double.maxFinite,
                                        margin: getMargin(top: 8),
                                        child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      padding: getPadding(
                                                          top: 13, bottom: 13),
                                                      decoration:
                                                          AppDecoration.white,
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: getPadding(
                                                                    left: 16,
                                                                    right: 16),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          "msg_available_doctors"
                                                                              .tr,
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                          style: AppStyle
                                                                              .txtHeadline),
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            onTapTxtViewalltwo();
                                                                          },
                                                                          child: Padding(
                                                                              padding: getPadding(
                                                                                  top:
                                                                                      4,
                                                                                  bottom:
                                                                                      2),
                                                                              child: Text(
                                                                                  "lbl_view_all".tr,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: AppStyle.txtAvenirRegular14)))
                                                                    ])),
                                                            SizedBox(
                                                              height:
                                                                  getVerticalSize(
                                                                      16),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  getVerticalSize(
                                                                      140),
                                                              child:
                                                                  ListView.builder(
                                                                padding: getPadding(
                                                                    left: 8,
                                                                    right: 8),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount: availableDoctor
                                                                            .length <
                                                                        2
                                                                    ? availableDoctor
                                                                        .length
                                                                    : 2,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  AvailableDoctor
                                                                      data =
                                                                      availableDoctor[
                                                                          index];
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      Get.toNamed(
                                                                          AppRoutes
                                                                              .bookAppointmentScreen);
                                                                    },
                                                                    child: Padding(
                                                                      padding:
                                                                          getPadding(
                                                                              left:
                                                                                  8,
                                                                              right:
                                                                                  8),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            getSize(
                                                                                341),
                                                                        height:
                                                                            getSize(
                                                                                140),
                                                                        decoration: AppDecoration
                                                                            .fillGray50
                                                                            .copyWith(
                                                                                borderRadius:
                                                                                    BorderRadiusStyle.roundedBorder8),
                                                                        child:
                                                                            Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  16,
                                                                              right:
                                                                                  16,
                                                                              top:
                                                                                  14,
                                                                              bottom:
                                                                                  14),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    height: getSize(74),
                                                                                    width: getSize(74),
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(getHorizontalSize(8)), image: DecorationImage(image: AssetImage(data.image!), fit: BoxFit.fill)),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: getHorizontalSize(21),
                                                                                  ),
                                                                                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Text(data.name!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtAvenirHeavy16),
                                                                                    Padding(padding: getPadding(top: 3), child: Text(data.category!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtFootnote)),
                                                                                    Padding(
                                                                                      padding: getPadding(
                                                                                        top: 3,
                                                                                      ),
                                                                                      child: Text(
                                                                                        data.experiance!,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: AppStyle.txtFootnote,
                                                                                      ),
                                                                                    ),
                                                                                  ])
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Padding(padding: getPadding(top: 4, bottom: 3), child: Text("16 jan | 10:00 am", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSubheadline)),
                                                                                    Container(padding: getPadding(left: 23, top: 2, right: 23, bottom: 2), decoration: AppDecoration.txtOutlineBlack900.copyWith(borderRadius: BorderRadiusStyle.txtRoundedBorder8), child: Text("lbl_book_now".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtAvenirRegular15))
                                                                                  ])
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Container(
                                                      height: getVerticalSize(140),
                                                      width: getHorizontalSize(55),
                                                      margin:
                                                          getMargin(bottom: 14)))
                                            ]))
                                  ]))))
                ])),
      ),
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.specialistScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.popularDoctorsScreen,
    );
  }

  onTapPopulardoctor2() {
    Get.toNamed(
      AppRoutes.doctorDetailsScreen,
    );
  }

  onTapTxtViewalltwo() {
    Get.toNamed(
      AppRoutes.avaliableDoctorsScreen,
    );
  }
}
