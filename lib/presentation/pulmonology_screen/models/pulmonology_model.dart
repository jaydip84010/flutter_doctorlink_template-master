import 'package:doctorapp/core/app_export.dart';
import 'pulmonology_item_model.dart';

/// This class defines the variables used in the [pulmonology_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PulmonologyModel {
  // Rx<List<PulmonologyItemModel>> pulmonologyItemList =
  //     Rx(List.generate(7, (index) => PulmonologyItemModel()));

  static List<PulmonologyItemModel> pulmonologyItemList(){
    return [
      PulmonologyItemModel(ImageConstant.imgPulmonology1st, "Dr. Jenny wilson","Sr Pulmonology","4.9"),
      PulmonologyItemModel(ImageConstant.imgPulmonology2nd, "Dr. Rochel Foose","Jn Pulmonology","4.6"),
      PulmonologyItemModel(ImageConstant.imgPulmonology3rd, "Dr. Brittni Lando","Jn Pulmonology","5.0"),
      PulmonologyItemModel(ImageConstant.imgPulmonology4th, "Dr.Marci Senter","Sr Pulmonology","5.0"),
      PulmonologyItemModel(ImageConstant.imgPulmonology5th, "Dr. Johnsie Jock","Jn Pulmonology","4.0"),
      PulmonologyItemModel(ImageConstant.imgPulmonology6th, "Dr.Kylee Danford","Sr Pulmonology","4.6"),
      PulmonologyItemModel(ImageConstant.imgPulmonology7th, "Dr. Charolette Hanlin","Sr Pulmonology","5.0"),
    ];
  }
}
