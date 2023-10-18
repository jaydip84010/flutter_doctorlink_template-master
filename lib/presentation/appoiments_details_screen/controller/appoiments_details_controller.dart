import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/appoiments_details_screen/models/appoiments_details_model.dart';/// A controller class for the AppoimentsDetailsScreen.
///
/// This class manages the state of the AppoimentsDetailsScreen, including the
/// current appoimentsDetailsModelObj
class AppoimentsDetailsController extends GetxController {Rx<AppoimentsDetailsModel> appoimentsDetailsModelObj = AppoimentsDetailsModel().obs;

 }
