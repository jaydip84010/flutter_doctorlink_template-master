import '../controller/switch_contory_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SwitchContoryCodeScreen.
///
/// This class ensures that the SwitchContoryCodeController is created when the
/// SwitchContoryCodeScreen is first loaded.
class SwitchContoryCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SwitchContoryCodeController());
  }
}
