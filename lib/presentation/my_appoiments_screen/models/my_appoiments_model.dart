import 'package:doctorapp/core/app_export.dart';
import 'myappoiments_item_model.dart';

/// This class defines the variables used in the [my_appoiments_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MyAppoimentsModel {
  // Rx<List<MyappoimentsItemModel>> myappoimentsItemList =
  //     Rx(List.generate(5, (index) => MyappoimentsItemModel()));

  static List<MyappoimentsItemModel> myappoimentsItemList(){
    return [
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment1st,"Dr. ronald richards","Orthopedic","\$90.00","25-06-2023","Cancelled"),
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment2nd,"Dr. Jenny wilson","Cardiology","\$90.00","18-06-2023","Reschedule"),
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment3rd,"Dr. Esther Howard","Neurologist","\$90.00","07-07-2023","Cancelled"),
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment4th,"Dr. Augustina Midgett","Pulmonology","\$90.00","16-06-2023","Upcoming"),
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment5th,"Dr. Leslie Alexander","Cardiology","\$90.00","15-06-2023","Reschedule"),
      MyappoimentsItemModel(ImageConstant.imgMyAppoinment6th,"Dr. ronald richards","Orthopedic","\$90.00","28-06-2023","Reschedule"),

    ];
  }
}
