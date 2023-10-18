import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/profille_screen/models/profille_model.dart';

/// A controller class for the ProfilleScreen.
///
/// This class manages the state of the ProfilleScreen, including the
/// current profilleModelObj
class ProfilleController extends GetxController {
  Rx<ProfilleModel> profilleModelObj = ProfilleModel().obs;
}
