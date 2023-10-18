import 'package:doctorapp/core/app_export.dart';
import 'orthopedic_item_model.dart';

/// This class defines the variables used in the [orthopedic_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OrthopedicModel {
  // Rx<List<OrthopedicItemModel>> orthopedicItemList =
  //     Rx(List.generate(7, (index) => OrthopedicItemModel()));
  static List<OrthopedicItemModel> orthopedicItemList(){
    return [
      OrthopedicItemModel(ImageConstant.imgOrthopadic1st,"Dr. Aileen Fullbright","Sr Orthopedic","5.0"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic2nd,"Dr. Esther Howard","Jn Orthopedic","4.9"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic3rd,"Dr. Georgette Strobel","Sr Orthopedic","5.0"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic4th,"Dr. Augustina Midgett","Jn Orthopedic","4.6"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic5th,"Dr. Annabel Rohan","Jn Orthopedic","5.0"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic6th,"Dr. Cyndy Lillibridge","Sr Orthopedic","4.0"),
      OrthopedicItemModel(ImageConstant.imgOrthopadic7th,"Dr. Chieko Chute","Sr Orthopedic","4.5"),
    ];
  }
}
