import '../controller/payment_method1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentMethod1Screen.
///
/// This class ensures that the PaymentMethod1Controller is created when the
/// PaymentMethod1Screen is first loaded.
class PaymentMethod1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethod1Controller());
  }
}
