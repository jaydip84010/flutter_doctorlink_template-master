import 'package:get/get.dart';import 'chat_item_model.dart';/// This class defines the variables used in the [chat1_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Chat1Model {Rx<List<ChatItemModel>> chatItemList = Rx(List.generate(6,(index) => ChatItemModel()));

 }
