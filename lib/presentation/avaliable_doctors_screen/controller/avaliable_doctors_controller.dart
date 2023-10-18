import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/avaliable_doctors_screen/models/avaliable_doctors_model.dart';/// A controller class for the AvaliableDoctorsScreen.
///
/// This class manages the state of the AvaliableDoctorsScreen, including the
/// current avaliableDoctorsModelObj
class AvaliableDoctorsController extends GetxController {Rx<AvaliableDoctorsModel> avaliableDoctorsModelObj = AvaliableDoctorsModel().obs;

 }
