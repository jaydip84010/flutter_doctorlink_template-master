import '../controller/appoiments_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AppoimentsDetailsScreen.
///
/// This class ensures that the AppoimentsDetailsController is created when the
/// AppoimentsDetailsScreen is first loaded.
class AppoimentsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppoimentsDetailsController());
  }
}
