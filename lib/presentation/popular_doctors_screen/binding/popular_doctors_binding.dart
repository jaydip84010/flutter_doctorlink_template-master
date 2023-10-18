import '../controller/popular_doctors_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PopularDoctorsScreen.
///
/// This class ensures that the PopularDoctorsController is created when the
/// PopularDoctorsScreen is first loaded.
class PopularDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularDoctorsController());
  }
}
