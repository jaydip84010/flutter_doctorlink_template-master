import 'dart:async';
import 'package:doctorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../phone_field/intl_phone_field.dart';
import '../phone_field/phone_number.dart';

class ColorConstant {
  static Color cyan8007e = fromHex('#7e1d718b');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color gray5001 = fromHex('#fafafa');

  static Color deepOrange50 = fromHex('#feebe2');

  static Color gray5002 = fromHex('#fff1fb');

  static Color red700 = fromHex('#d83636');

  static Color teal40063 = fromHex('#634193a6');

  static Color red600 = fromHex('#f22d42');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#f8f8f8');

  static Color black9001e = fromHex('#1e000000');
  static Color lightPurple = fromHex('#EBF0FF');

  static Color teal100 = fromHex('#b7e1e2');

  static Color red50 = fromHex('#ffebf0');
  static Color red = fromHex('#D93636');

  static Color blueGray4006c = fromHex('#6c70a5a6');

  static Color black90087 = fromHex('#87050823');

  static Color greenA700 = fromHex('#04b155');

  static Color black90066 = fromHex('#66000000');

  static Color black90000 = fromHex('#00000000');

  static Color black900 = fromHex('#000000');

  static Color black90063 = fromHex('#63000000');

  static Color blue5002 = fromHex('#eaefff');

  static Color blue5001 = fromHex('#e5f1fa');

  static Color teal5001 = fromHex('#e4ebee');

  static Color purple50 = fromHex('#fce9ff');

  static Color black90026 = fromHex('#26000000');

  static Color gray600 = fromHex('#6b6b6b');

  static Color deepPurple5001 = fromHex('#f0edff');
  static Color lightOrange = fromHex('#FFF0EA');

  static Color black9004c = fromHex('#4c000000');

  static Color cyan8006c = fromHex('#6c1d718b');

  static Color blueGray400 = fromHex('#888888');

  static Color red5002 = fromHex('#ffefe9');

  static Color indigo50 = fromHex('#e1e2fb');

  static Color amber700 = fromHex('#e1a200');

  static Color black9000f = fromHex('#0f000000');

  static Color red5001 = fromHex('#ffeef0');

  static Color lightBlue50 = fromHex('#daf8ff');

  static Color teal50 = fromHex('#e1eff4');

  static Color gray200 = fromHex('#f0f0f0');

  static Color gray300 = fromHex('#e4e4e4');

  static Color blue50 = fromHex('#e9f4f8');
  static Color lightBlue = fromHex('#DBF8FF');

  static Color deepPurple90087 = fromHex('#87371491');

  static Color deepPurple50 = fromHex('#efefff');

  static Color indigo100 = fromHex('#bdbfeb');

  static Color cyan800 = fromHex('#1d718b');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray8004c = fromHex('#4c3c3c43');

  static Color black90016 = fromHex('#16000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
closeApp() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    SystemNavigator.pop();
  });
}



Widget phone_number_field(controller,FutureOr<String?> Function(PhoneNumber?)? validator){
  return  IntlPhoneField(
    controller: controller,
    disableLengthCheck: true,
    showCountryFlag: false,
    flagsButtonMargin: EdgeInsets.only(
        left: 16, top: 12, bottom: 12, right: 14),
    style: TextStyle(
      color: ColorConstant.black900,
      fontSize: getFontSize(
        16,
      ),
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w300,
    ),
    dropdownTextStyle: TextStyle(
      color: ColorConstant.black900,
      fontSize: getFontSize(
        16,
      ),
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w300,
    ),
    cursorColor: ColorConstant.cyan800,
    dropdownIconPosition: IconPosition.trailing,
    dropdownDecoration: BoxDecoration(
      // border: Border(
      //     right: BorderSide(
      //         color: ColorConstant.gray300))
    ),
    dropdownIcon: Icon(
      Icons.keyboard_arrow_down_outlined,
      color: ColorConstant.black900,
    ),
    validator: validator,

    //     (p0) {
    //   if (p0 == null || p0.number.isEmpty) {
    //     return "Enter valid number";
    //   }
    //   return null;
    // },
    decoration: InputDecoration(
      floatingLabelStyle: TextStyle(
        color: ColorConstant.black900,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w300,
      ),
      contentPadding: EdgeInsets.zero,
      // labelStyle: TextStyle(
      //   color: ColorConstant.black900,
      //   fontSize: getFontSize(
      //     13,
      //   ),
      //   fontFamily: 'Outfit',
      //   fontWeight: FontWeight.w400,
      // ),
      // labelText: "Phone number",
      label: Text(
        "Phone number",
        style: TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w300,
        ),
      ),
      // label: Align(alignment: Alignment.topLeft,child: Text("Phone number",textAlign: TextAlign.left,)),
      hintText: "Phone number",
      hintStyle: TextStyle(
        color: ColorConstant.gray600,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w300,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getHorizontalSize(8))),
        borderSide: BorderSide(
          color: ColorConstant.red,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getHorizontalSize(8))),
        borderSide: BorderSide(
          color: ColorConstant.cyan800,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getHorizontalSize(8))),
        borderSide: BorderSide(
          color: ColorConstant.gray300,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getHorizontalSize(8))),
        borderSide: BorderSide(
          color: ColorConstant.cyan800,
          width: 1,
        ),
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    ),
    initialCountryCode: 'IN',
    onChanged: (phone) {
      print(phone.completeNumber);
    },
  );
}