import '../controller/bokking_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BokkingSuccessScreen.
///
/// This class ensures that the BokkingSuccessController is created when the
/// BokkingSuccessScreen is first loaded.
class BokkingSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BokkingSuccessController());
  }
}
