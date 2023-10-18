import '../controller/pulmonology_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PulmonologyScreen.
///
/// This class ensures that the PulmonologyController is created when the
/// PulmonologyScreen is first loaded.
class PulmonologyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PulmonologyController());
  }
}
