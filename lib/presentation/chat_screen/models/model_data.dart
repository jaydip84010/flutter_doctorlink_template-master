import 'package:doctorapp/core/app_export.dart';

import 'call_model.dart';
import 'chat_model.dart';

class ModelData{
  static List<ChatModel> getChatData(){
    return [
      ChatModel(ImageConstant.imgChatImage1st,"Dr. Jenny wilson","Awesome","0","22:00"),
      ChatModel(ImageConstant.imgChatImage2nd,"Dr. Theresa Webb","Awesome","0","22:00"),
      ChatModel(ImageConstant.imgChatImage3rd,"Dr. Darrell Steward","Awesome","1","22:00"),
      ChatModel(ImageConstant.imgChatImage4th,"Dr. Charolette Hanlin","Awesome","0","22:00"),
      ChatModel(ImageConstant.imgChatImage5th,"Dr. Arlene McCoy","Awesome","1","22:00"),
      ChatModel(ImageConstant.imgChatImage6th,"Dr. Chieko Chute","Awesome","0","22:00"),
    ];}

    static List<CallModel> getCallData(){
      return [
        CallModel(ImageConstant.imgChatImage1st,"Dr. Jenny wilson","Outgoing","Dec 20, 2023","vidio"),
        CallModel(ImageConstant.imgChatImage2nd,"Dr. Theresa Webb","Outgoing","Dec 20, 2023","voice"),
        CallModel(ImageConstant.imgChatImage3rd,"Dr. Darrell Steward","Outgoing","Dec 20, 2023","vidio"),
        CallModel(ImageConstant.imgChatImage4th,"Dr. Charolette Hanlin","Outgoing","Dec 20, 2023","voice"),
        CallModel(ImageConstant.imgChatImage5th,"Dr. Arlene McCoy","Outgoing","Dec 20, 2023","vidio"),
        CallModel(ImageConstant.imgChatImage6th,"Dr. Chieko Chute","Outgoing","Dec 20, 2023","vidio"),
      ];
    }

}