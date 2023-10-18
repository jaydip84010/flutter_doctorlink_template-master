import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case IconButtonPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      default:
        return getPadding(
          all: 7,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.White:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillTeal50:
        return ColorConstant.teal50;
      case IconButtonVariant.FillTeal40063:
        return ColorConstant.teal40063;
      case IconButtonVariant.OutlineBlack9000f_1:
        return ColorConstant.teal50;
      case IconButtonVariant.FillGray200:
        return ColorConstant.gray200;
      case IconButtonVariant.FillRed600:
        return ColorConstant.red600;
      case IconButtonVariant.FillRed700:
        return ColorConstant.red700;
      case IconButtonVariant.OutlineBlack9000f:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.blue50;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case IconButtonShape.CircleBorder23:
        return BorderRadius.circular(
          getHorizontalSize(
            23.00,
          ),
        );
      case IconButtonShape.CircleBorder27:
        return BorderRadius.circular(
          getHorizontalSize(
            27.00,
          ),
        );
      case IconButtonShape.CircleBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.White:
        return [
          BoxShadow(
            color: ColorConstant.black9001e,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case IconButtonVariant.OutlineBlack9000f_1:
        return [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ];
      case IconButtonVariant.OutlineBlack9000f:
        return [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case IconButtonVariant.FillBlue50:
      case IconButtonVariant.FillTeal50:
      case IconButtonVariant.FillTeal40063:
      case IconButtonVariant.FillGray200:
      case IconButtonVariant.FillRed600:
      case IconButtonVariant.FillRed700:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  CircleBorder18,
  RoundedBorder8,
  CircleBorder23,
  CircleBorder27,
  CircleBorder14,
}
enum IconButtonPadding {
  PaddingAll7,
  PaddingAll12,
  PaddingAll15,
}
enum IconButtonVariant {
  FillBlue50,
  White,
  FillTeal50,
  FillTeal40063,
  OutlineBlack9000f_1,
  FillGray200,
  FillRed600,
  FillRed700,
  OutlineBlack9000f,
}
