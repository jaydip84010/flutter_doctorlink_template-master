import '../controller/doctor_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DoctorDetailsScreen.
///
/// This class ensures that the DoctorDetailsController is created when the
/// DoctorDetailsScreen is first loaded.
class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorDetailsController());
  }
}
