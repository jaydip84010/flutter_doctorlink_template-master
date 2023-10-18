import 'package:get/get.dart';

/// This class is used in the [myappoiments_item_widget] screen.

class MyappoimentsItemModel {
  Rx<String> nameTxt = Rx("Dr. ronald richards");

  Rx<String> specialtyTxt = Rx("Orthopedic");

  Rx<String> dateTxt = Rx("25-06-2023");

  Rx<String>? id = Rx("");

  String? image;
  String? name;
  String? category;
  String? price;
  String? date;
  String? status;
  MyappoimentsItemModel(this.image,this.name,this.category,this.price,this.date,this.status);
}
