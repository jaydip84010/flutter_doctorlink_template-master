import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFloatingEditText extends StatelessWidget {
  CustomFloatingEditText(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.labelText,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  FloatingEditTextShape? shape;

  FloatingEditTextPadding? padding;

  FloatingEditTextVariant? variant;

  FloatingEditTextFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? labelText;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildFloatingEditTextWidget(),
          )
        : _buildFloatingEditTextWidget();
  }

  _buildFloatingEditTextWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(

        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style:  TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        ),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      floatingLabelStyle: TextStyle(
        color: ColorConstant.black900,
        fontSize: getFontSize(
          13,
        ),
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w300,
      ),
      labelText: labelText ?? "",
        labelStyle: TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        ),
      hintText: hintText ?? "",
      errorStyle:  TextStyle(
        color:ColorConstant.red,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w300,
      ),
      hintStyle: TextStyle(
        color: ColorConstant.gray600,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w300,
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(variant: FloatingEditTextVariant.OutlineGray300),
      focusedBorder: _setBorderStyle(variant: FloatingEditTextVariant.Outlinecyan800),
      disabledBorder: _setBorderStyle(),
      errorBorder: _setBorderStyle(variant: FloatingEditTextVariant.OutlineRed700),
      focusedErrorBorder: _setBorderStyle(variant: FloatingEditTextVariant.Outlinecyan800),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }


  _setOutlineBorderRadius() {
    switch (shape) {
      case FloatingEditTextShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setBorderStyle({FloatingEditTextVariant? variant}) {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          borderSide: BorderSide(
            color: ColorConstant.red,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.Outlinecyan800:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          borderSide: BorderSide(
            color: ColorConstant.cyan800,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return ColorConstant.whiteA700;
      case FloatingEditTextVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case FloatingEditTextVariant.Outlinecyan800:
        return ColorConstant.whiteA700;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case FloatingEditTextVariant.floatingtextfield1:
        return false;
      case FloatingEditTextVariant.OutlineRed700:
        return true;
      case FloatingEditTextVariant.OutlineGray300:
        return true;
      case FloatingEditTextVariant.Outlinecyan800:
        return true;
      case FloatingEditTextVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case FloatingEditTextPadding.PaddingTB15:
        return getPadding(
          left: 13,
          top: 13,
          right: 13,
          bottom: 15,
        );
      case FloatingEditTextPadding.PaddingTB23:
        return getPadding(
          left: 15,
          top: 15,
          right: 15,
          bottom: 23,
        );
      default:
        return getPadding(
          left: 15,
          top: 22,
          right: 15,
          bottom: 15,
        );
    }
  }
}

enum FloatingEditTextShape {
  RoundedBorder16,
  RoundedBorder8,
}
enum FloatingEditTextPadding {
  PaddingT22,
  PaddingTB15,
  PaddingTB23,
}
enum FloatingEditTextVariant {
  None,
  floatingtextfield1,
  OutlineRed700,
  OutlineGray300,
  Outlinecyan800,

}
enum FloatingEditTextFontStyle {
  AvenirRegular16,
  AvenirRegular15,
}
