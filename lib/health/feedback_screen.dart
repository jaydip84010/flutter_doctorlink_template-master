import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:doctorapp/generated/l10n.dart';



class FeedBack extends StatefulWidget {
  FeedBack({Key? key}) : super(key: key);


  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  double rate = 3.0;
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
      backgroundColor: ConstantData.bgColor,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Column(
          children: [
            Container(decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(0, 4),blurRadius: 22,
                      color: ConstantData.shadowColor.withOpacity(0.20)
                  )
                ],
                color: ConstantData.bgColor
            ),child: appBar((){
              Get.back();
            },text: "Feedback",).paddingSymmetric(vertical: 16.h,horizontal: 20.h)),
            getVerSpace(24.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 0.h),
                children: [
                  Container(
                    width: double.infinity,
                    color: ConstantData.bgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("Give Feedback", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w700),
                      getVerSpace(8.h),
                        getCustomFont("Give your feedback about our app", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400),
                       getVerSpace(40.h),
                        getCustomFont("Are you satisfied with this app?", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400),
                        SizedBox(height: 16.h),
                        ratingbar(),
                        getVerSpace(40.h),
                        getCustomFont("Tell us what can be improved!", 17.sp, ConstantData.textColor, 1,fontWeight: FontWeight.w400)
                        ,
                        SizedBox(height: 20.h),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.h))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.h),
                                  borderSide:
                                  BorderSide(color: ConstantData.blackColor, width: 1.h)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.h),
                                  borderSide:
                                  BorderSide(color: Color(0XFFDFDFDF), width: 1.h)),
                              hintText: 'Write your feedback...',
                              hintStyle: TextStyle(color: Color(0XFF6E758A), fontSize: 16.sp,fontFamily:ConstantData.fontFamily)),
                          maxLines: 5,
                        ),


                      ],
                    ).paddingSymmetric(vertical: 20.h,horizontal: 20.h),
                  ),
                ],
              ),
            ),
            custumButton((){
              sendMail();
            }, "Submit",color: ConstantData.accentColor,textcolor: Colors.white).paddingOnly(bottom: 40.h,left: 20.h,right: 20.h)
          ],
        ),
      ),
    );
  }
  Future<void> sendMail() async {
    final MailOptions mailOptions = MailOptions(
      body: '',
      subject: S.of(context).appName + ': App Feedback',
      recipients: ['templatevilla007@gmail.com'],
      isHTML: true,
    );

    await FlutterMailer.send(mailOptions);
  }

  ratingbar() {
    return RatingBar(
      initialRating: rate,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 32,
      glow: false,

      ratingWidget: RatingWidget(
          full: Image(image:AssetImage(ConstantData.assetsPath+"fidbackfillicon.png")),
          half: Image(image: AssetImage(ConstantData.assetsPath+"fidbackemptyicon.png"),),
          empty:Image(image: AssetImage(ConstantData.assetsPath+"fidbackemptyicon.png"),)
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

}
