import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/popular_doctors_screen/models/popular_doctors_model.dart';/// A controller class for the PopularDoctorsScreen.
///
/// This class manages the state of the PopularDoctorsScreen, including the
/// current popularDoctorsModelObj
class PopularDoctorsController extends GetxController {Rx<PopularDoctorsModel> popularDoctorsModelObj = PopularDoctorsModel().obs;

 }
