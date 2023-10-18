import '../controller/reset_passsword_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ResetPassswordSuccessScreen.
///
/// This class ensures that the ResetPassswordSuccessController is created when the
/// ResetPassswordSuccessScreen is first loaded.
class ResetPassswordSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPassswordSuccessController());
  }
}
