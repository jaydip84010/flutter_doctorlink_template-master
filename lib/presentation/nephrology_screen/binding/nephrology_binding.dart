import '../controller/nephrology_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NephrologyScreen.
///
/// This class ensures that the NephrologyController is created when the
/// NephrologyScreen is first loaded.
class NephrologyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NephrologyController());
  }
}
