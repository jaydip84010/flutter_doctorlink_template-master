import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
  Rx<OnboardingOneModel> onboardingOneModelObj = OnboardingOneModel().obs;

  Rx<int> sliderIndex = 0.obs;
  int currentPage = 0;

  void setCurrentPage(int value) {
    currentPage = value;
    update();
  }




}
