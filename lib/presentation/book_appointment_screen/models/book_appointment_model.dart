import 'book_item_model.dart';

/// This class defines the variables used in the [book_appointment_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookAppointmentModel {
  // Rx<List<BookItemModel>> bookItemList =
  //     Rx(List.generate(4, (index) => BookItemModel()));

  static List<BookItemModel> bookItemList(){
    return [
      BookItemModel("23 Jan to 26 Jan","6 Slot available"),
      BookItemModel("28 Jan to 30 Jan","2 Slot available"),
      BookItemModel("26 Jan to 31 Jan","3 Slot available"),
      BookItemModel("01 Feb to 06 Feb","4 Slot available"),
    ];
  }
}
