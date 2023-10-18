import '../controller/avaliable_doctors_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AvaliableDoctorsScreen.
///
/// This class ensures that the AvaliableDoctorsController is created when the
/// AvaliableDoctorsScreen is first loaded.
class AvaliableDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvaliableDoctorsController());
  }
}
