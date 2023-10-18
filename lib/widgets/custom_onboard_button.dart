import 'package:flutter/material.dart';

class CustomOnboardButton extends StatelessWidget {
  double height;
  double width;
  var selectbtn;
  var btntext;

  CustomOnboardButton(
      {Key? key,
      required this.height,
      required this.width,
      this.selectbtn,
      this.btntext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {},
          child: Container(
            height: height,
            width: width,
            child: Text(
              btntext,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/AAWI-Resources_Button 1.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
