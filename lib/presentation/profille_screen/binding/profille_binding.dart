import '../controller/profille_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ProfilleScreen.
///
/// This class ensures that the ProfilleController is created when the
/// ProfilleScreen is first loaded.
class ProfilleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilleController());
  }
}
