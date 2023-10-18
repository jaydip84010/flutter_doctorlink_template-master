import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';

import 'models/chat_model.dart';
import 'models/model_data.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  List<ChatModel> chat = ModelData.getChatData();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: chat.length,primary: false,shrinkWrap: true,itemBuilder: (context, index) {
      ChatModel data = chat[index];

      return    GestureDetector(
        onTap: (){
          Get.toNamed(AppRoutes.chatDetailsScreen);
        },
        child: Container(
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
                          data.subtitle!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtFootnoteGray600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  data.noOfNotification=="0" ?SizedBox(  height: getSize(24),
                    width: getSize(24),):Container(
                   height: getSize(24),
                   width: getSize(24),
                   decoration: BoxDecoration(shape: BoxShape.circle,
                     color: ColorConstant.cyan800
                   ),
                   child: Center(
                     child: Text(
                       data.noOfNotification!,
                       style: AppStyle.txtBodyWhiteA700,
                     ),
                   ),
                 ),
                  SizedBox(height: getVerticalSize(9),),
                  Text(
                    data.minit!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBodyGray600,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },);
  }
}
