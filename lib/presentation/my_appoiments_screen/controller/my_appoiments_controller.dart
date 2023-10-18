import 'package:doctorapp/core/app_export.dart';import 'package:doctorapp/presentation/my_appoiments_screen/models/my_appoiments_model.dart';/// A controller class for the MyAppoimentsScreen.
///
/// This class manages the state of the MyAppoimentsScreen, including the
/// current myAppoimentsModelObj
class MyAppoimentsController extends GetxController {Rx<MyAppoimentsModel> myAppoimentsModelObj = MyAppoimentsModel().obs;

 }
