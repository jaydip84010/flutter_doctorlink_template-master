import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/my_cards_screen/models/my_cards_model.dart';import 'package:flutter/material.dart';/// A controller class for the MyCardsScreen.
///
/// This class manages the state of the MyCardsScreen, including the
/// current myCardsModelObj
class MyCardsController extends GetxController {TextEditingController paypalController = TextEditingController();

TextEditingController visaController = TextEditingController();

TextEditingController applepayController = TextEditingController();

Rx<MyCardsModel> myCardsModelObj = MyCardsModel().obs;

@override void onClose() { super.onClose(); paypalController.dispose(); visaController.dispose(); applepayController.dispose(); } 
 }
