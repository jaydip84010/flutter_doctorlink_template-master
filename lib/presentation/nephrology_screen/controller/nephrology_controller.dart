import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/nephrology_screen/models/nephrology_model.dart';/// A controller class for the NephrologyScreen.
///
/// This class manages the state of the NephrologyScreen, including the
/// current nephrologyModelObj
class NephrologyController extends GetxController {Rx<NephrologyModel> nephrologyModelObj = NephrologyModel().obs;

 }
