import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/pulmonology_screen/models/pulmonology_model.dart';/// A controller class for the PulmonologyScreen.
///
/// This class manages the state of the PulmonologyScreen, including the
/// current pulmonologyModelObj
class PulmonologyController extends GetxController {Rx<PulmonologyModel> pulmonologyModelObj = PulmonologyModel().obs;

 }
