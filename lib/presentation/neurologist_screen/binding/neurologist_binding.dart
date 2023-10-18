import '../controller/neurologist_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NeurologistScreen.
///
/// This class ensures that the NeurologistController is created when the
/// NeurologistScreen is first loaded.
class NeurologistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NeurologistController());
  }
}
