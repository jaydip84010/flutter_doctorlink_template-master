import 'notifications_item_model.dart';

/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {
  // Rx<List<NotificationsItemModel>> notificationsItemList =
  //     Rx(List.generate(8, (index) => NotificationsItemModel()));
  static List<NotificationsItemModel> notificationsItemList(){
    return [
      NotificationsItemModel("Your Booking Completed","Your appointment has completed Successfully","3 h ago"),
      NotificationsItemModel("Your appointment Cancelled","Your appointment has been Cancelled successfully","3 h ago"),
      NotificationsItemModel("Your appointment Booked","Your appointment has been booked Successfully","3 h ago"),
      NotificationsItemModel("Your Booking Completed","Your appointment has completed Successfully","3 h ago"),
      NotificationsItemModel("Your appointment Cancelled","Your appointment has been Cancelled successfully","3 h ago"),
      NotificationsItemModel("Your appointment Booked","Your appointment has been booked Successfully","3 h ago"),
      NotificationsItemModel("Your Booking Completed","Your appointment has completed Successfully","3 h ago"),
      NotificationsItemModel("Your appointment Cancelled","Your appointment has been Cancelled successfully","3 h ago"),
      NotificationsItemModel("Your appointment Booked","Your appointment has been booked Successfully","3 h ago"),
    ];
  }
}
