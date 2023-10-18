import 'package:doctorapp/core/app_export.dart';
import 'paymentmethod_item_model.dart';

/// This class defines the variables used in the [payment_method_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PaymentMethodModel {
  // Rx<List<PaymentmethodItemModel>> paymentmethodItemList =
  //     Rx(List.generate(4, (index) => PaymentmethodItemModel()));

  static List<PaymentmethodItemModel> paymentmethodItemList() {
    return [
      PaymentmethodItemModel(ImageConstant.imgMassagingIcon, "Massaging",
          "Chat massage with doctor", "\$25.00", "/30 mins"),
      PaymentmethodItemModel(ImageConstant.imgVoiceCallIcon, "Voice call",
          "Chat massage with doctor", "\$40.00", "/30 mins"),
      PaymentmethodItemModel(ImageConstant.imgVidioCallIcon, "Vidio call",
          "Chat massage with doctor", "\$50.00", "/30 mins"),
      PaymentmethodItemModel(ImageConstant.imgVisitClinicIcon, "Visit clinic",
          "Chat massage with doctor", "\$60.00", "/30 mins"),
    ];
  }
}
