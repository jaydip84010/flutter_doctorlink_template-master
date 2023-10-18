import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/orthopedic_screen/models/orthopedic_model.dart';/// A controller class for the OrthopedicScreen.
///
/// This class manages the state of the OrthopedicScreen, including the
/// current orthopedicModelObj
class OrthopedicController extends GetxController {Rx<OrthopedicModel> orthopedicModelObj = OrthopedicModel().obs;

 }
