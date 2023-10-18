import 'package:get/get.dart';import 'populardoctors_item_model.dart';/// This class defines the variables used in the [popular_doctors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PopularDoctorsModel {Rx<List<PopulardoctorsItemModel>> populardoctorsItemList = Rx(List.generate(8,(index) => PopulardoctorsItemModel()));

 }
