import '../controller/orthopedic_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrthopedicScreen.
///
/// This class ensures that the OrthopedicController is created when the
/// OrthopedicScreen is first loaded.
class OrthopedicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrthopedicController());
  }
}
