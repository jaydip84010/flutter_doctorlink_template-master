import '../controller/book_appointment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BookAppointmentScreen.
///
/// This class ensures that the BookAppointmentController is created when the
/// BookAppointmentScreen is first loaded.
class BookAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookAppointmentController());
  }
}
