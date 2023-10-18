import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/payment_method1_screen/models/payment_method1_model.dart';

class PaymentMethods{
  static List<PaymentMethod1Model> getPaymentMethods(){
    return [
      PaymentMethod1Model(ImageConstant.imgPaypalIcon,"Paypal"),
      PaymentMethod1Model(ImageConstant.imgVisaIcon,"Visa"),
      PaymentMethod1Model(ImageConstant.imgApplePayIcon,"Apple pay"),
      PaymentMethod1Model(ImageConstant.imgGooglePayIcon,"Google pay"),
    ];
  }
}