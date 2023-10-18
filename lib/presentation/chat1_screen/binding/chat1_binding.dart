import '../controller/chat1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Chat1Screen.
///
/// This class ensures that the Chat1Controller is created when the
/// Chat1Screen is first loaded.
class Chat1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Chat1Controller());
  }
}
