import 'package:doctorapp/generated/l10n.dart';
import 'package:doctorapp/health/model/ResultModel.dart';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/AdsFile.dart';
import 'package:doctorapp/health/utils/AdsInfo.dart';
import 'package:doctorapp/health/utils/ads_interface.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ConstantData.dart';
import 'PrefData.dart';
import 'SizeConfig.dart';

class ConstantWidget {
  static const double defScreenWidth = 414;
  static const double defScreenHeight = 896;

  static double getPercentSize(double total, double percent) {
    return (total * percent) / 100;
  }

  static double largeTextSize = 28;

  static double getHeaderSize(BuildContext context) {
    return ConstantWidget.getScreenPercentSize(context, 3);
  }

  static double getSubTitleSize(BuildContext context) {
    return ConstantWidget.getScreenPercentSize(context, 2);
  }

  static double getActionTextSize(BuildContext context) {
    return ConstantWidget.getScreenPercentSize(context, 1.8);
  }

  static double getDefaultDialogPadding(BuildContext context) {
    return ConstantWidget.getScreenPercentSize(context, 2);
  }

  static double getDefaultDialogRadius(BuildContext context) {
    return ConstantWidget.getScreenPercentSize(context, 1);
  }

  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

  static double getWidthPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width * percent) / 100;
  }

  static Widget getSpace(double space) {
    return SizedBox(
      height: space,
    );
  }

  static Widget getDefaultTextWidget(String s, TextAlign textAlign,
      FontWeight fontWeight, double fontSize, var color) {
    return Text(
      s,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: ConstantData.fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color),
    );
  }

  static Widget textOverFlowWidget(String s, FontWeight fontWeight, int maxLine,
      double fontSize, Color color) {
    return new Text(
      s,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        fontFamily: ConstantData.fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  static Widget getCustomText(String text, Color color, int maxLine,
      TextAlign textAlign, FontWeight fontWeight, double textSizes) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: ConstantData.fontFamily,
          fontWeight: fontWeight),
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }

  static Widget getTextFiled(BuildContext context, Color themeColor, String s,
      double height, TextEditingController textEditingController,
      [bool? bool = false]) {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 5.5);

    final ThemeData theme = ThemeData();

    return Container(
      height: cellHeight,
      child: Theme(
        data: new ThemeData(
          primaryColor: ConstantData.textColor,
          colorScheme:
              theme.colorScheme.copyWith(secondary: ConstantData.textColor),
          hintColor: ConstantData.textColor,
        ),
        child: TextFormField(
          maxLines: 1,
          controller: textEditingController,
          textInputAction: (bool != null)
              ? (bool)
                  ? TextInputAction.done
                  : TextInputAction.next
              : TextInputAction.next,
          cursorColor: ConstantData.textColor,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          // Only numbers
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: ConstantWidget.getPercentSize(cellHeight, 30),
              color: ConstantData.textColor,
              fontFamily: ConstantData.fontFamily,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            labelText: s,
            labelStyle: TextStyle(
                decoration: TextDecoration.none,
                fontSize: ConstantWidget.getPercentSize(cellHeight, 30),
                color: ConstantData.textColor,
                fontFamily: ConstantData.fontFamily,
                fontWeight: FontWeight.w300),
            hintStyle: TextStyle(
                decoration: TextDecoration.none,
                fontSize: ConstantWidget.getPercentSize(cellHeight, 25),
                color: ConstantData.textColor,
                fontFamily: ConstantData.fontFamily,
                fontWeight: FontWeight.w300),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  static Widget getDropDown(BuildContext context, String value,
      List<DropdownMenuItem<String>> _dropDownMenuItems, Function function) {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 7);

    return Container(
      height: 54.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: DropdownButtonFormField(
        isExpanded: true,
        value: value,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: ConstantWidget.getPercentSize(cellHeight, 25),
            color: ConstantData.textColor,
            fontFamily: ConstantData.fontFamily,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 16.h, right: 16.h),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(color: ConstantData.textfieldBorder)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(color: ConstantData.accentColor)),
        ),
        items: _dropDownMenuItems,
        onChanged: (value) {
          function(value);
        },
        dropdownColor: ConstantData.iconContainerBg,
      ),
    );
  }

  static Widget getImage(Color themeColor, BuildContext context, String s) {
    double cellHeight = ConstantWidget.getScreenPercentSize(context, 7);

    double imgHeight = ConstantWidget.getPercentSize(cellHeight, 62);
    double imgWidth = ConstantWidget.getWidthPercentSize(context, 8);

    Color color = themeColor;

    print("s----${s.isEmpty}");
    if (s.isEmpty) {
      color = Colors.transparent;
      s = "frequency-reading.png";
    }
    return Container(
      margin: EdgeInsets.only(
          right: ConstantWidget.getWidthPercentSize(context, 4)),
      child: Image.asset(
        ConstantData.assetsPath + s,
        color: color,
        height: imgHeight,
        width: imgWidth,
      ),
      // ),
    );
  }

  static getButton(
      BuildContext context, String s, Color color, Function function) {
    double buttonHeight = ConstantWidget.getScreenPercentSize(context, 6);

    double subRadius = ConstantWidget.getWidthPercentSize(context, 1.5);
    double fontSize = ConstantWidget.getPercentSize(buttonHeight, 32);
    double sliderHeight = SizeConfig.safeBlockVertical! * 18;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);

    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: (margin)),
        height: buttonHeight,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(subRadius))),
        child: Center(
          child: ConstantWidget.getDefaultTextWidget(
              s, TextAlign.center, FontWeight.w500, fontSize, Colors.white),
        ),
      ),
      onTap: () {
        function();
      },
    );
  }

  static getMoreInformationButton(
    BuildContext context,
    String link,
    Color color,
  ) {
    double buttonHeight = ConstantWidget.getScreenPercentSize(context, 6);

    double subRadius = ConstantWidget.getWidthPercentSize(context, 1.5);
    double fontSize = ConstantWidget.getPercentSize(buttonHeight, 32);
    double sliderHeight = SizeConfig.safeBlockVertical! * 18;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);

    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: (margin)),
        height: buttonHeight,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(subRadius))),
        child: Center(
          child: ConstantWidget.getDefaultTextWidget(
              S.of(context).moreInformation,
              TextAlign.center,
              FontWeight.w500,
              fontSize,
              Colors.white),
        ),
      ),
      onTap: () {
        ConstantData.launchURL(link);
      },
    );
  }

  static getDecoration(BuildContext context, Color themeColor) {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: themeColor,
            width: ConstantWidget.getScreenPercentSize(context, 0.2)));
  }

  static getBanner(AdsFile? adsFile) {
    if (adsFile == null) {
      return Container();
    } else {
      return showBanner(adsFile);
    }
  }

  static getAppBar(String s, Color color, Color iconColor, double elevation,
      Function function) {
    return AppBar(
        backgroundColor: color,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: color, statusBarBrightness: Brightness.dark),
        title: Text(
          s,
          style: TextStyle(
              fontFamily: ConstantData.fontFamily,
              color: iconColor,
              fontWeight: FontWeight.w700),
        ),
        elevation: elevation,
        leading: InkWell(
          onTap: () {
            function();
          },
          child: Icon(
            Icons.keyboard_backspace_outlined,
            color: iconColor,
          ),
        ));
  }

  static getSubDefaultWidget(
      BuildContext context, Widget widget, RowItem rowItem, Function function) {
    double sliderHeight = SizeConfig.safeBlockVertical! * 12;
    double radius = ConstantWidget.getScreenPercentSize(context, 3.5);
    double margin = ConstantWidget.getPercentSize(sliderHeight, 10);

    return WillPopScope(
        child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,

            // appBar: ConstantWidget.getAppBar(
            //     rowItem.title ?? "", rowItem.color!, Colors.black, 0, function),

            appBar: getNoneAppbar(color: rowItem.color),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: ConstantData.bgColor,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 22,
                            color: ConstantData.shadowColor)
                      ], color: rowItem.color!),
                      child: appBar(
                        () {
                          function();
                        },
                        text: rowItem.title ?? "",
                      ).paddingSymmetric(vertical: 16.h, horizontal: 20.h)),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: sliderHeight,
                          color: rowItem.color,
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ConstantData.bgColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(radius),
                              topLeft: Radius.circular(radius),
                            ),
                          ),
                          padding: EdgeInsets.all(margin),
                          child: widget,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        onWillPop: () async {
          function();
          return false;
        });
  }

  static getBottomButton(BuildContext context, String s, Function function) {
    double bottomHeight = ConstantWidget.getScreenPercentSize(context, 10);
    double height = ConstantWidget.getPercentSize(bottomHeight, 49);

    return Container(
        height: bottomHeight,
        child: GestureDetector(
            child: Center(
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    color: ConstantData.accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(16.h))),
                child: Center(
                  child: ConstantWidget.getDefaultTextWidget(
                    s,
                    TextAlign.center,
                    FontWeight.w700,
                    ConstantWidget.getPercentSize(height, 38),
                    Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {
              function();
            }));
  }

  static getMainDefaultWidget(BuildContext context, Widget widget,
      RowItem rowItem, Function function, title,
      {AdsFile? adsFile}) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantData.bgColor,

          appBar: getNoneAppbar(color: ConstantData.appbarBgColor),

          body: SafeArea(
            child: GestureDetector(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 22,
                                    color: ConstantData.shadowColor)
                              ], color: ConstantData.appbarBgColor),
                              child: appBar(
                                () {
                                  Get.back();
                                },
                                text: title,
                              ).paddingSymmetric(
                                  vertical: 16.h, horizontal: 20.h)),
                          widget
                        ],
                      ),
                    ),
                  ),
                  ConstantWidget.getBanner(adsFile)
                ],
              ),
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
          ),
          // bottomNavigationBar: (adsFile!=null)?ConstantWidget.getBanner(adsFile):Container(height: 0,)
        ),
        onWillPop: () async {
          function();
          return false;
        });
  }

  static getNoneAppbar({Color? color}) {
    var light = isDarkTheme.value == 1 ? Brightness.light : Brightness.dark;
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: color == null ? Colors.white : color,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: color == null ? Colors.white : color,

        statusBarBrightness: Brightness.dark,

        statusBarIconBrightness: light, // For Android (dark icons)
        // statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static getMainDefaultWidgetNew(
      BuildContext context,
      Widget widget,
      RowItem rowItem,
      Function function,
      title,
      icon,
      imageColor,
      subTitle,
      willpopfunction,
      {AdsFile? adsFile}) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantData.bgColor,
          appBar: getNoneAppbar(color: imageColor),
          body: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                      height: 184.h,
                      width: double.infinity,
                      child: getSvgImage("",
                          height: 184.h,
                          color: rowItem.color,
                          width: double.infinity,
                          boxFit: BoxFit.fill)),
                  // getSvgImage("ideal_weight_screen_bg.svg", height: 184.h,color: imageColor,width: double.infinity),
                  SafeArea(
                    child: Column(
                      children: [
                        getVerSpace(26.h),
                        appBar(() {
                          Get.back();
                        },
                                iconcolor: Colors.black,
                                widget: getCustomFont(
                                    title, 21.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w700),
                                action: GestureDetector(
                                    onTap: () {
                                      function();
                                    },
                                    child: getSvgImage("Refresh.svg",
                                        height: 35.h, width: 35.h)))
                            .paddingSymmetric(horizontal: 20.h),
                        getVerSpace(61.h),
                        Container(
                          height: 100.h,
                          width: 100.h,
                          child: getSvgImage(icon).paddingAll(20.h),
                        ),
                      ],
                    ),
                  )
                ]),
                Expanded(
                    child: ListView(children: [
                  getVerSpace(12.h),
                  getMultilineCustomFont(
                          subTitle, 17.sp, ConstantData.textColor,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center)
                      .paddingSymmetric(horizontal: 53.h),
                  widget
                ])),
                ConstantWidget.getBanner(adsFile)
              ],
            ),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
          ),
          // bottomNavigationBar: (adsFile!=null)?ConstantWidget.getBanner(adsFile):Container(height: 0,)
        ),
        onWillPop: () async {
          willpopfunction();
          return false;
        });
  }

  static getInterstitialAd(Function function, AdsInterfaces interface) {
    InterstitialAd.load(
        adUnitId: getInterstitialAdUnitId(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interface.onAdLoad(ad);
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (InterstitialAd ad) =>
                  print('%ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (InterstitialAd ad) {
                print('$ad onAdDismissedFullScreenContent.');
                ad.dispose();
                interface.onAdClose();
              },
              onAdFailedToShowFullScreenContent:
                  (InterstitialAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
              },
              onAdImpression: (InterstitialAd ad) =>
                  print('$ad impression occurred.'),
            );

            // _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  static sendData(
      BuildContext context, ResultModel resultModel, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static showAds(
      InterstitialAd? interstitialAd, ValueChanged<bool> function) async {
    // static showAds(AdmobInterstitial  interstitialAd,ValueChanged<bool> function)async{

    int click = await PrefData.getClick();
    // bool load=await interstitialAd.isLoaded;

    // if(load && click > 1){
    if (interstitialAd != null && click > 1) {
      interstitialAd.show();
      PrefData.setClick(0);
      // function(false);
    } else {
      PrefData.setClick((click + 1));
      function(true);
    }
  }

  static launchURL(String? link) async {
    if (link != null && link.isNotEmpty)
      // ignore: deprecated_member_use
      await launch(link);
  }

  static getButtonWidget(BuildContext context, Color themeColor, String s,
      String link, ValueChanged<String> function) {
    double buttonHeight = ConstantWidget.getScreenPercentSize(context, 6);

    double subRadius = ConstantWidget.getWidthPercentSize(context, 1.5);
    double fontSize = ConstantWidget.getPercentSize(buttonHeight, 32);
    double sliderHeight = SizeConfig.safeBlockVertical! * 18;

    double margin = ConstantWidget.getPercentSize(sliderHeight, 13);

    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      child: Center(
                        child: ConstantWidget.getDefaultTextWidget(
                            S.of(context).calculate,
                            TextAlign.center,
                            FontWeight.w500,
                            fontSize,
                            Colors.white),
                      ),
                    ),
                    onTap: () {
                      function(ConstantData.calculate);
                    },
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      margin:
                          EdgeInsets.only(left: (margin / 3), top: (margin)),
                      height: buttonHeight,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              width: ConstantWidget.getPercentSize(
                                  buttonHeight, 1.5),
                              color: themeColor),
                          borderRadius:
                              BorderRadius.all(Radius.circular(subRadius))),
                      child: Center(
                        child: ConstantWidget.getDefaultTextWidget(
                            S.of(context).reset,
                            TextAlign.center,
                            FontWeight.w500,
                            fontSize,
                            themeColor),
                      ),
                    ),
                    onTap: () {
                      function(ConstantData.reset);
                    },
                  ),
                  flex: 1,
                )
              ],
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: (margin)),
                height: buttonHeight,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(subRadius))),
                child: Center(
                  child: ConstantWidget.getDefaultTextWidget(
                      s,
                      TextAlign.center,
                      FontWeight.w500,
                      fontSize,
                      Colors.white),
                ),
              ),
              onTap: () {
                function(ConstantData.chart);
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: (margin)),
                height: buttonHeight,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(subRadius))),
                child: Center(
                  child: ConstantWidget.getDefaultTextWidget(
                      S.of(context).moreInformation,
                      TextAlign.center,
                      FontWeight.w500,
                      fontSize,
                      Colors.white),
                ),
              ),
              onTap: () {
                ConstantData.launchURL(link);
              },
            )
          ],
        ),
        SizedBox(
          height: getScreenPercentSize(context, 3),
        )
      ],
    );
  }
}

initializeScreenSize(BuildContext context,
    {double width = 414, double height = 896}) {
  ScreenUtil.init(context, designSize: Size(width, height), minTextAdapt: true);
}

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    ConstantData.assetsPath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return color == null
      ? SvgPicture.asset(
          ConstantData.assetsPath + image,
          width: width,
          height: height,
          fit: boxFit,
        )
      : SvgPicture.asset(
          ConstantData.assetsPath + image,
          width: width,
          color: color,
          // colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          height: height,
          fit: boxFit,
        );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double horSpace) {
  return SizedBox(
    width: horSpace,
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
      decoration: decoration,
      fontSize: fontSize,
      color: fontColor,
      fontFamily: ConstantData.fontFamily,
      height: txtHeight ?? 1.5.h,
      fontWeight: fontWeight,
    ),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: ConstantData.fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget animation_function(index, child,
    {Duration? listAnimation, Duration? slideduration, Duration? slidedelay}) {
  // return child;
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? Duration(milliseconds: 100),
    child: SlideAnimation(
      duration: slideduration ?? Duration(milliseconds: 100),
      delay: slidedelay ?? Duration(milliseconds: 0),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}

Widget getRichtext(String firsttext, String secondtext,
    {Function? function,
    Color? firsttextcolor,
    Color? secondtextcolor,
    double? firsttextSize,
    double? secondtextSize,
    FontWeight? firstTextwidth,
    FontWeight? secondTextwidth}) {
  return Center(
    child: RichText(
        text: TextSpan(
            text: firsttext,
            style: TextStyle(
                color: firsttextcolor ?? ConstantData.textColor,
                fontSize: firsttextSize ?? 15.sp,
                fontFamily: ConstantData.fontFamily,
                fontWeight: firstTextwidth ?? FontWeight.w500),
            children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                function!();
              },
            text: secondtext,
            style: TextStyle(
                color: secondtextcolor ?? ConstantData.grayColor,
                fontSize: firsttextSize ?? 15.sp,
                fontWeight: firstTextwidth ?? FontWeight.w700,
                fontFamily: ConstantData.fontFamily),
          )
        ])),
  );
}

Widget appBar(function, {Widget? widget, text, action, iconcolor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
          onTap: () {
            function();
          },
          child: getSvgImage("Back Arrow.svg", height: 35.h, width: 35.h)),
      widget ??
          getCustomFont(text, 21.sp, ConstantData.textColor, 1,
              fontWeight: FontWeight.w700),
      action ?? SizedBox(),
    ],
  );
}

Widget getTextField(TextEditingController controller, hinttext,
    {textInputAction, suffixWidget}) {
  print("controllerText==============${controller.text}");
  return TextFormField(
    maxLines: 1,
    controller: controller,
    textInputAction: textInputAction ?? null,
    cursorColor: ConstantData.accentColor,
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],

    // Only numbers
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 15.sp,
        color: ConstantData.textColor,
        fontFamily: ConstantData.fontFamily,
        fontWeight: FontWeight.w400),

    decoration: InputDecoration(
      hintText: hinttext,
      contentPadding: EdgeInsets.only(left: 16.h),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: ConstantData.textfieldBorder)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: ConstantData.accentColor)),
      suffixIcon: suffixWidget ?? SizedBox(),
      hintStyle: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 15.sp,
          color: ConstantData.hintColor,
          fontFamily: ConstantData.fontFamily,
          fontWeight: FontWeight.w300),
      border: OutlineInputBorder(),
    ),
  );
}

Widget custumButton(function, text,
    {color, fontsize, fontWeight, textcolor, decoration}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      height: 50.h,
      width: double.infinity,
      decoration: decoration ??
          BoxDecoration(
              color: color ?? ConstantData.lightGrayColor,
              borderRadius: BorderRadius.circular(16.h)),
      child: Center(
          child: getCustomFont(
              text, fontsize ?? 17.sp, textcolor ?? ConstantData.textColor, 1,
              fontWeight: fontWeight ?? FontWeight.w400)),
    ),
  );
}

Widget get_page_layout(function, title, icon, imageColor, subTitle, widget) {
  return Scaffold(
      body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(children: [
        Container(
            height: 184.h,
            width: double.infinity,
            child: getSvgImage("ideal_weight_screen_bg.svg",
                height: 184.h,
                color: imageColor,
                width: double.infinity,
                boxFit: BoxFit.fill)),
        // getSvgImage("ideal_weight_screen_bg.svg", height: 184.h,color: imageColor,width: double.infinity),
        SafeArea(
          child: Column(
            children: [
              getVerSpace(26.h),
              appBar(() {
                Get.back();
              },
                      text: title,
                      action: GestureDetector(
                          onTap: () {
                            function();
                          },
                          child: getSvgImage("Refresh.svg",
                              height: 35.h, width: 35.h)))
                  .paddingSymmetric(horizontal: 20.h),
              getVerSpace(41.h),
              Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                    color: ConstantData.bgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.h),
                        topRight: Radius.circular(50.h),
                        bottomRight: Radius.circular(16.h),
                        bottomLeft: Radius.circular(16.h)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 22,
                          color: ConstantData.shadowColor.withOpacity(0.20))
                    ]),
                child: getSvgImage(icon).paddingAll(20.h),
              ),
            ],
          ),
        )
      ]),
      Expanded(
          child: ListView(children: [
        getVerSpace(12.h),
        getMultilineCustomFont(subTitle, 17.sp, ConstantData.blackColor,
                fontWeight: FontWeight.w400, textAlign: TextAlign.center)
            .paddingSymmetric(horizontal: 53.h),
        widget
      ]))
    ],
  ));
}
