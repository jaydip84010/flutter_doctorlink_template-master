import 'package:get/get.dart';

/// This class is used in the [paymentmethod_item_widget] screen.

class PaymentmethodItemModel {
  Rx<String> typeTxt = Rx("Massaging");

  Rx<String> descriptionTxt = Rx("Chat massage with doctor");

  Rx<String> priceTxt = Rx("25.00");

  Rx<String>? id = Rx("");


  String? icon;
  String? title;
  String? subtitle;
  String? price;
  String? minit;
  PaymentmethodItemModel(this.icon,this.title,this.subtitle,this.price,this.minit);
}
