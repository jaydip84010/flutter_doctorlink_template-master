import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/payment_method_screen/models/payment_method_model.dart';
import 'package:flutter/material.dart';

import '../models/add_new_card_popup.dart';

/// A controller class for the PaymentMethodScreen.
///
/// This class manages the state of the PaymentMethodScreen, including the
/// current paymentMethodModelObj
class PaymentMethodController extends GetxController {
  TextEditingController timeController = TextEditingController();

  Rx<PaymentMethodModel> paymentMethodModelObj = PaymentMethodModel().obs;

  int currentPackege = 0;

  Rx<AddNewCardModel> addNewCardModelObj = AddNewCardModel().obs;

  void setCurrentPackege(int index) {
    currentPackege = index;
    update();
  }

  onSelected(dynamic value) {
    for (var element in addNewCardModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addNewCardModelObj.value.dropdownItemList.refresh();
  }
}
