import 'package:get/get.dart';import 'avaliable_item_model.dart';/// This class defines the variables used in the [avaliable_doctors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AvaliableDoctorsModel {Rx<List<AvaliableItemModel>> avaliableItemList = Rx(List.generate(5,(index) => AvaliableItemModel()));

 }
