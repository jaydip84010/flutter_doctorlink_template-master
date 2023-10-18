import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/switch_contory_code_screen/models/switch_contory_code_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SwitchContoryCodeScreen.
///
/// This class manages the state of the SwitchContoryCodeScreen, including the
/// current switchContoryCodeModelObj
class SwitchContoryCodeController extends GetxController {
  TextEditingController conturyController = TextEditingController();

  TextEditingController conturyoneController = TextEditingController();

  TextEditingController conturytwoController = TextEditingController();

  TextEditingController conturythreeController = TextEditingController();

  TextEditingController conturyfourController = TextEditingController();

  TextEditingController conturyfiveController = TextEditingController();

  TextEditingController conturysixController = TextEditingController();

  TextEditingController conturysevenController = TextEditingController();

  TextEditingController conturyeightController = TextEditingController();

  TextEditingController conturynineController = TextEditingController();

  TextEditingController conturytenController = TextEditingController();

  Rx<SwitchContoryCodeModel> switchContoryCodeModelObj =
      SwitchContoryCodeModel().obs;

  @override
  void onClose() {
    super.onClose();
    conturyController.dispose();
    conturyoneController.dispose();
    conturytwoController.dispose();
    conturythreeController.dispose();
    conturyfourController.dispose();
    conturyfiveController.dispose();
    conturysixController.dispose();
    conturysevenController.dispose();
    conturyeightController.dispose();
    conturynineController.dispose();
    conturytenController.dispose();
  }
}
