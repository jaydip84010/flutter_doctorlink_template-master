import 'package:doctorapp/core/app_export.dart';

/// A controller class for the PaymentMethod1Screen.
///
/// This class manages the state of the PaymentMethod1Screen, including the
/// current paymentMethod1ModelObj
class PaymentMethod1Controller extends GetxController {
int currentPaymentMethos = 0;

  // Rx<PaymentMethod1Model> paymentMethod1ModelObj = PaymentMethod1Model().obs;



  void setCurrentPaymentMethod(int index) {
    currentPaymentMethos = index;
    update();
  }
}
