import '../controller/reset_passsword_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ResetPassswordScreen.
///
/// This class ensures that the ResetPassswordController is created when the
/// ResetPassswordScreen is first loaded.
class ResetPassswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPassswordController());
  }
}
