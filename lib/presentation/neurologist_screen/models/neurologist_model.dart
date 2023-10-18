import 'package:doctorapp/core/app_export.dart';
import 'neurologist_item_model.dart';

/// This class defines the variables used in the [neurologist_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NeurologistModel {
//   Rx<List<NeurologistItemModel>> neurologistItemList =
//       Rx(List.generate(7, (index) => NeurologistItemModel()));
static List<NeurologistItemModel> neurologistItemList(){
 return [
  NeurologistItemModel(ImageConstant.imgNeurologist1st,"Dr. Ronald richards","Orthopadic","5.0"),
  NeurologistItemModel(ImageConstant.imgNeurologist2nd,"Dr. Leslie Alexander","Jn Neurologist","5.0"),
  NeurologistItemModel(ImageConstant.imgNeurologist3rd,"Dr. Robert Fox","Jn Neurologist","5.0"),
  NeurologistItemModel(ImageConstant.imgNeurologist4th,"Dr. Darrell Steward","Sr Neurologist","4.9"),
  NeurologistItemModel(ImageConstant.imgNeurologist5th,"Dr. Cameron","Sr Neurologist","4.5"),
  NeurologistItemModel(ImageConstant.imgNeurologist6th,"Dr. Esther Howard","Jn Neurologist","4.9"),
  NeurologistItemModel(ImageConstant.imgNeurologist7th,"Dr. Guy Hawkins","Sr Neurologist","4.6"),
 ];
}
}
// }
