import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/add_a_card_one_screen/models/add_a_card_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddACardOneScreen.
///
/// This class manages the state of the AddACardOneScreen, including the
/// current addACardOneModelObj
class AddACardOneController extends GetxController {TextEditingController nameController = TextEditingController();

TextEditingController cardnumberController = TextEditingController();

TextEditingController expirydateoneController = TextEditingController();

TextEditingController cvvController = TextEditingController();

Rx<AddACardOneModel> addACardOneModelObj = AddACardOneModel().obs;

@override void onClose() { super.onClose(); nameController.dispose(); cardnumberController.dispose(); expirydateoneController.dispose(); cvvController.dispose(); } 
 }
