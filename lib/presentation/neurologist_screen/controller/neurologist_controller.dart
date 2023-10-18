import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/neurologist_screen/models/neurologist_model.dart';/// A controller class for the NeurologistScreen.
///
/// This class manages the state of the NeurologistScreen, including the
/// current neurologistModelObj
class NeurologistController extends GetxController {Rx<NeurologistModel> neurologistModelObj = NeurologistModel().obs;

 }
