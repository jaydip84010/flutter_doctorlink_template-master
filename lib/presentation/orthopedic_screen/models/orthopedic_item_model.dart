import 'package:get/get.dart';

/// This class is used in the [orthopedic_item_widget] screen.

class OrthopedicItemModel {
  Rx<String> ratingTxt = Rx("5.0");

  Rx<String>? id = Rx("");

  String? image;
  String? name;
  String? category;
  String? rataing;
  OrthopedicItemModel(this.image,this.name,this.category,this.rataing);
}
