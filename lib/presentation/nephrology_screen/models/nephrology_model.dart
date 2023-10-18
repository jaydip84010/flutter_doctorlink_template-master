import 'package:doctorapp/core/app_export.dart';
import 'nephrology_item_model.dart';

/// This class defines the variables used in the [nephrology_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NephrologyModel {


  static List<NephrologyItemModel> nephrologyItemList(){
   return [
    NephrologyItemModel(ImageConstant.imgNephtology1st,"Dr. Courtney Henry","Sr Nephrology","5.0"),
    NephrologyItemModel(ImageConstant.imgNephtology2nd,"Dr. Kathryn Murphy","Jn Nephrology","4.9"),
    NephrologyItemModel(ImageConstant.imgNephtology3rd,"Dr. Darrell Steward","Sr Nephrology","5.0"),
    NephrologyItemModel(ImageConstant.imgNephtology4th,"Dr.Jerome Bell","Jn Nephrology","4.5"),
    NephrologyItemModel(ImageConstant.imgNephtology5th,"Dr. Theresa Webb","Sr Nephrology","5.0"),
    NephrologyItemModel(ImageConstant.imgNephtology6th,"Dr. Darrell Steward","Jn Nephrology","4.8"),
    NephrologyItemModel(ImageConstant.imgNephtology7th,"Dr. Arlene McCoy","Jn Nephrology","5.0"),
   ];
  }
}
