import '../controller/call_meeting_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CallMeetingScreen.
///
/// This class ensures that the CallMeetingController is created when the
/// CallMeetingScreen is first loaded.
class CallMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallMeetingController());
  }
}
