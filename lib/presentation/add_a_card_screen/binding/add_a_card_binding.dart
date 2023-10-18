import '../controller/add_a_card_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddACardScreen.
///
/// This class ensures that the AddACardController is created when the
/// AddACardScreen is first loaded.
class AddACardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddACardController());
  }
}
