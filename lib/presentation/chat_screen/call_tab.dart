import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';

import 'models/call_model.dart';
import 'models/model_data.dart';



class CallTab extends StatefulWidget {
  const CallTab({Key? key}) : super(key: key);

  @override
  State<CallTab> createState() => _CallTabState();
}

class _CallTabState extends State<CallTab> {
  List<CallModel> callData =  ModelData.getCallData();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: callData.length,primary: false,shrinkWrap: true,itemBuilder: (context, index) {
      CallModel data = callData[index];

      return    Container(
        margin: getMargin(
          left: 16,
          top: 16,
          right: 16,
        ),
        padding: getPadding(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16
        ),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: data.image,
                  height: getSize(
                    58,
                  ),
                  width: getSize(
                    58,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      29,
                    ),
                  ),
                ),
                SizedBox(width: getHorizontalSize(16),),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.name!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtHeadline,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 2,
                      ),
                      child: Text(
                        "${data.callCategory!} | ${data.date!}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtFootnoteGray600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(offset: Offset(0, 0),
                color: ColorConstant.black900.withOpacity(0.06),
                ),

              ],
                  shape: BoxShape.circle,
                  color: ColorConstant.teal50),
              child: CustomImageView(
                svgPath:  data.callType == "vidio" ?ImageConstant.imgVidioCallIcon:ImageConstant.imgVoiceCallIcon,
              margin: getMargin(all: 8),
                color: ColorConstant.black900,
              ),
            )
          ],
        ),
      );
    },);
  }
}


