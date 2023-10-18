import 'package:get/get.dart';

/// This class is used in the [slidermanageyou_item_widget] screen.

class SlidermanageyouItemModel {
  Rx<String>? id = Rx("");
  String? image;
  String? title;

  SlidermanageyouItemModel(this.image,[this.title]);
}
