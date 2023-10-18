import '../controller/my_appoiments_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyAppoimentsScreen.
///
/// This class ensures that the MyAppoimentsController is created when the
/// MyAppoimentsScreen is first loaded.
class MyAppoimentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppoimentsController());
  }
}
