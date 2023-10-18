import '../controller/specialist_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SpecialistScreen.
///
/// This class ensures that the SpecialistController is created when the
/// SpecialistScreen is first loaded.
class SpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialistController());
  }
}
