import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case ButtonPadding.PaddingT16:
        return getPadding(
          top: 16,
          right: 16,
          bottom: 16,
        );
      case ButtonPadding.PaddingAll22:
        return getPadding(
          all: 22,
        );
      case ButtonPadding.PaddingT12:
        return getPadding(
          left: 12,
          top: 12,
          bottom: 12,
        );
      case ButtonPadding.PaddingT4:
        return getPadding(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      default:
        return getPadding(
          all: 12,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.White:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack90016:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillGray50:
        return ColorConstant.gray50;
      case ButtonVariant.FillGray5001:
        return ColorConstant.gray5001;
      case ButtonVariant.FillBlue50:
        return ColorConstant.blue50;
      case ButtonVariant.FillGray200:
        return ColorConstant.gray200;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.OutlineBlack900:
      case ButtonVariant.OutlineRed700:
      case ButtonVariant.OutlineGreenA700:
      case ButtonVariant.OutlineAmber700:
      case ButtonVariant.OutlineCyan800:
        return null;
      default:
        return ColorConstant.cyan800;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlack900:
        return BorderSide(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineRed700:
        return BorderSide(
          color: ColorConstant.red700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGreenA700:
        return BorderSide(
          color: ColorConstant.greenA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineAmber700:
        return BorderSide(
          color: ColorConstant.amber700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineCyan800:
        return BorderSide(
          color: ColorConstant.cyan800,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillCyan800:
      case ButtonVariant.White:
      case ButtonVariant.OutlineBlack90016:
      case ButtonVariant.FillGray50:
      case ButtonVariant.FillGray5001:
      case ButtonVariant.FillBlue50:
      case ButtonVariant.FillGray200:
      case ButtonVariant.FillWhiteA700:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.White:
        return ColorConstant.black9001e;
      case ButtonVariant.OutlineBlack90016:
        return ColorConstant.black90016;
      case ButtonVariant.FillCyan800:
      case ButtonVariant.FillGray50:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.FillGray5001:
      case ButtonVariant.FillBlue50:
      case ButtonVariant.FillGray200:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineBlack900:
      case ButtonVariant.OutlineRed700:
      case ButtonVariant.OutlineGreenA700:
      case ButtonVariant.OutlineAmber700:
      case ButtonVariant.OutlineCyan800:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CustomBorderBL8:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderTL8:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.CustomBorderTL24:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              24.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              24.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.Subheadline:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AvenirMedium17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyle.AvenirBlack20:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AvenirRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyle.AvenirBlack18Cyan800:
        return TextStyle(
          color: ColorConstant.cyan800,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SubheadlineGray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AvenirRegular15:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyle.AvenirHeavy14:
        return TextStyle(
          color: ColorConstant.red700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AvenirHeavy14GreenA700:
        return TextStyle(
          color: ColorConstant.greenA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AvenirHeavy14Amber700:
        return TextStyle(
          color: ColorConstant.amber700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProDisplayBold18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  CustomBorderBL8,
  CustomBorderTL8,
  RoundedBorder16,
  CustomBorderTL24,
}
enum ButtonPadding {
  PaddingAll12,
  PaddingAll4,
  PaddingT16,
  PaddingAll22,
  PaddingT12,
  PaddingT4,
  PaddingAll9,
}
enum ButtonVariant {
  FillCyan800,
  White,
  OutlineBlack90016,
  FillGray50,
  OutlineGray300,
  FillGray5001,
  FillBlue50,
  FillGray200,
  FillWhiteA700,
  OutlineBlack900,
  OutlineRed700,
  OutlineGreenA700,
  OutlineAmber700,
  OutlineCyan800,
}
enum ButtonFontStyle {
  AvenirBlack18,
  Subheadline,
  AvenirMedium17,
  AvenirBlack20,
  AvenirRegular16,
  AvenirBlack18Cyan800,
  SubheadlineGray600,
  AvenirRegular15,
  AvenirHeavy14,
  AvenirHeavy14GreenA700,
  AvenirHeavy14Amber700,
  SFProDisplayBold18,
}
