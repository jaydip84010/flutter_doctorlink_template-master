import 'package:doctorapp/core/app_export.dart';
import 'slidermanageyou_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  // Rx<List<SlidermanageyouItemModel>> slidermanageyouItemList =
  //     Rx(List.generate(1, (index) => SlidermanageyouItemModel()));

  static List<SlidermanageyouItemModel> getOnboardingData(){
    return [
      SlidermanageyouItemModel(ImageConstant.imgOnbording4rd,"\n\n\n"),
      SlidermanageyouItemModel(ImageConstant.imgOnbording1st,"Race, Gender, Ethnicity \nSexual Preference & More\n Affect The Quality of Healthcare\nYou Receive"),
      SlidermanageyouItemModel(ImageConstant.imgOnbording2nd,"\n\n\n"),
      SlidermanageyouItemModel(ImageConstant.imgOnbording3rd,"\n\n\n"),
    ];

  }
}
