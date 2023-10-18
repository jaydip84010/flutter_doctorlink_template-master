import 'package:get/get.dart';

/// This class is used in the [banner_item_widget] screen.

class BannerItemModel {
  Rx<String>? id = Rx("");
  String? image;
  String? title;
  BannerItemModel(this.image,this.title);
}
