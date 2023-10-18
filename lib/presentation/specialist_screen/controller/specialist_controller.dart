import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/specialist_screen/models/specialist_model.dart';

/// A controller class for the SpecialistScreen.
///
/// This class manages the state of the SpecialistScreen, including the
/// current specialistModelObj
class SpecialistController extends GetxController {
  Rx<SpecialistModel> specialistModelObj = SpecialistModel().obs;
  int? currentindex;

  void setCurrentIndex(int index) {
    currentindex = index;
    update();
  }
}
