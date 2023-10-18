import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.country,
    required this.onTap,
    required this.controller,
  }) : super(
          key: key,
        );

  Country country;

  Function(Country) onTap;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8,
          ),
        ),
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 13,
                bottom: 15,
              ),
              child: Row(
                children: [
                  Text(
                    "+${country.phoneCode}",
                    style: AppStyle.txtBody,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowdown,
                    height: getSize(
                      12,
                    ),
                    width: getSize(
                      12,
                    ),
                    margin: getMargin(
                      left: 13,
                      top: 7,
                      bottom: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomTextFormField(
              width: getHorizontalSize(
                315,
              ),
              focusNode: FocusNode(),
              autofocus: true,
              controller: controller,
              hintText: "msg_205_555_0100_688".tr,
              margin: getMargin(
                left: 16,
                right: 6,
              ),
              variant: TextFormFieldVariant.None,
              fontStyle: TextFormFieldFontStyle.AvenirRegular16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: getHorizontalSize(10),
            ),
            width: getHorizontalSize(60.0),
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
        ],
      );
  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: getFontSize(14)),
          ),
          isSearchable: true,
          title: Text('Select your phone code',
              style: TextStyle(fontSize: getFontSize(14))),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
