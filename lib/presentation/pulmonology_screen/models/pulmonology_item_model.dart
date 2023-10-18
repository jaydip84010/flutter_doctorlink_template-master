import 'package:get/get.dart';

/// This class is used in the [pulmonology_item_widget] screen.

class PulmonologyItemModel {
  Rx<String> ratingTxt = Rx("4.9");

  Rx<String>? id = Rx("");
  String? image;
  String? name;
  String? category;
  String? rating;
  PulmonologyItemModel(this.image,this.name,this.category,this.rating);

}
