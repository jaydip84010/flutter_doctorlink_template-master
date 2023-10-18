import 'package:get/get.dart';import 'specialist_item_model.dart';/// This class defines the variables used in the [specialist_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SpecialistModel {Rx<List<SpecialistItemModel>> specialistItemList = Rx(List.generate(12,(index) => SpecialistItemModel()));

 }
