import 'package:get/get.dart';

/// This class is used in the [notifications_item_widget] screen.

class NotificationsItemModel {
  Rx<String> statusTxt = Rx("Your Booking Completed");

  Rx<String> messageTxt = Rx("Your appointment has completed Successfully");

  Rx<String>? id = Rx("");
  String? msg;
  String? title;
  String? time;
  NotificationsItemModel(this.title,this.msg,this.time);
}
