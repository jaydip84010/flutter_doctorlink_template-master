import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';


// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.autofocus = false,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffixConstraints,
      this.items,
      this.onChanged,
      this.validator});

  DropDownShape? shape;

  DropDownPadding? padding;

  DropDownVariant? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  bool? autofocus;

  Widget? icon;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;
  BoxConstraints? suffixConstraints;

  List<SelectionPopupModel>? items;

  Function(SelectionPopupModel)? onChanged;

  FormFieldValidator<SelectionPopupModel>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: DropdownButtonFormField<SelectionPopupModel>(
        focusNode: focusNode,
        autofocus: autofocus!,
        icon: icon,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
        items: items?.map((SelectionPopupModel item) {
          return DropdownMenuItem<SelectionPopupModel>(
            value: item,
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (value) {
          onChanged!(value!);
        },
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(getHorizontalSize(8)),
        borderSide: BorderSide(
          color: ColorConstant.gray300,
          width: 1,
        ),
      ),
      focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(getHorizontalSize(8)),
        borderSide: BorderSide(
          color: ColorConstant.gray300,
          width: 1,
        ),
      ),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case DropDownFontStyle.SFUITextRegular13:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case DropDownFontStyle.SFUITextRegular15:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case DropDownFontStyle.SFUITextSemibold16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case DropDownShape.RoundedBorder8:
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

  _setBorderStyle() {
    switch (variant) {
      case DropDownVariant.OutlineGray600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray600,
            width: 1,
          ),
        );
      case DropDownVariant.FillGray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case DropDownVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray600,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case DropDownVariant.FillGray100:
        return ColorConstant.gray200;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case DropDownVariant.OutlineGray6006c:
        return false;
      case DropDownVariant.OutlineGray600:
        return false;
      case DropDownVariant.FillGray100:
        return true;
      case DropDownVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case DropDownPadding.PaddingT2:
        return getPadding(
          top: 2,
          bottom: 2,
        );
      case DropDownPadding.PaddingT12:
        return getPadding(
          left: 8,
          top: 12,
          bottom: 12,
        );
      case DropDownPadding.PaddingT18:
        return getPadding(
          left: 16,
          top: 18,
          bottom: 18,
        );
      default:
        return getPadding(
          left: 15,
          top: 15,
          bottom: 15,
        );
    }
  }
}

enum DropDownShape {
  RoundedBorder16,
  RoundedBorder8,
}
enum DropDownPadding {
  PaddingT15,
  PaddingT2,
  PaddingT12,
  PaddingT18,
}
enum DropDownVariant {
  None,
  OutlineGray6006c,
  OutlineGray600,
  FillGray100,
}
enum DropDownFontStyle {
  SFUITextMedium15,
  SFUITextRegular13,
  SFUITextRegular15,
  SFUITextSemibold16,
}
