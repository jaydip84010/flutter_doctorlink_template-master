import 'package:get/get.dart';/// This class is used in the [neurologist_item_widget] screen.
class NeurologistItemModel {Rx<String> nameTxt = Rx("Dr. Ronald richards");

Rx<String> specialtyTxt = Rx("Orthopedic");

Rx<String> ratingTxt = Rx("5.0");

Rx<String>? id = Rx("");

String? image;
String? name;
String? category;
String? rate;

NeurologistItemModel(this.image,this.name,this.category,this.rate);
 }
