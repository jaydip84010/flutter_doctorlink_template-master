import 'package:get/get.dart';

/// This class is used in the [book_item_widget] screen.

class BookItemModel {
  Rx<String> daterangeTxt = Rx("23 Jan to 26 Jan");

  Rx<String> k2slotavailableTxt = Rx("6 Slot available");

  Rx<String>? id = Rx("");
  String? date;
  String? slot;
  BookItemModel(this.date,this.slot);
}
