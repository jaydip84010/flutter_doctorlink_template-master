import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/book_appointment_screen/models/book_appointment_model.dart';

/// A controller class for the BookAppointmentScreen.
///
/// This class manages the state of the BookAppointmentScreen, including the
/// current bookAppointmentModelObj
class BookAppointmentController extends GetxController {
  Rx<BookAppointmentModel> bookAppointmentModelObj = BookAppointmentModel().obs;
int currentSlot = 0;
int currentTimeId = 1;
  void setCurrentSlot(int index) {
    currentSlot = index;
    update();
  }

  void setCurrentTime(id) {
    currentTimeId = id;
    update();
  }
}
