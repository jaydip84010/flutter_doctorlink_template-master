import '../controller/add_a_card_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddACardOneScreen.
///
/// This class ensures that the AddACardOneController is created when the
/// AddACardOneScreen is first loaded.
class AddACardOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddACardOneController());
  }
}
