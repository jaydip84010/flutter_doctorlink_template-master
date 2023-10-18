import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/filter_screen/models/filter_model.dart';

/// A controller class for the FilterScreen.
///
/// This class manages the state of the FilterScreen, including the
/// current filterModelObj
class FilterController extends GetxController {
  Rx<FilterModel> filterModelObj = FilterModel().obs;
int currentNowOrLaterId = 1;
int currentMeetDoctor = 1;
  void setNowOrLaterId(id) {
    currentNowOrLaterId = id;
    update();
  }

  void setMeettheDoctorId(id) {
    currentMeetDoctor = id;
    update();
  }
}
