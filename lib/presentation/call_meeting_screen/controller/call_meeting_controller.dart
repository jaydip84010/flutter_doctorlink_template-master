import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/call_meeting_screen/models/call_meeting_model.dart';

/// A controller class for the CallMeetingScreen.
///
/// This class manages the state of the CallMeetingScreen, including the
/// current callMeetingModelObj
class CallMeetingController extends GetxController {
  Rx<CallMeetingModel> callMeetingModelObj = CallMeetingModel().obs;
}
