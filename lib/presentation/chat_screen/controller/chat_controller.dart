import 'package:doctorapp/core/app_export.dart';

/// A controller class for the ChatScreen.
///
/// This class manages the state of the ChatScreen, including the
/// current chatModelObj
class ChatController extends GetxController {
  // Rx<ChatModel> chatModelObj = ChatModel().obs;
  int currentPage = 0;

  void setCurrentPage(int i) {
    currentPage = i;
    update();
  }
}
