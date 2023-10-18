import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/home_page_screen/models/popular_doctor_model.dart';
import 'package:doctorapp/presentation/home_page_screen/models/specialist_category_model.dart';
import 'available_doctor_model.dart';
import 'banner_item_model.dart';

/// This class defines the variables used in the [home_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomePageModel {
  // Rx<List<BannerItemModel>> bannerItemList =
  //     Rx(List.generate(2, (index) => BannerItemModel()));
  static List<BannerItemModel> bannerItemList(){
    return [
      BannerItemModel(ImageConstant.imgSlider1st,"Our excellent care is our speciality"),
      BannerItemModel(ImageConstant.imgSlider2nd,"Live consultation easily with top doctors"),
      BannerItemModel(ImageConstant.imgSlider1st,"Live consultation easily with top doctors"),
    ];
  }
  static List<SpecialistCategory> getSpecialistCategory(){
    return [
      SpecialistCategory(ImageConstant.imgNeurologist,"Neurologist",ColorConstant.deepOrange50),
      SpecialistCategory(ImageConstant.imgOrthopadic,"Orthopedic",ColorConstant.deepPurple50),
      SpecialistCategory(ImageConstant.imgTestReport,"Test Report",ColorConstant.red5001),
      SpecialistCategory(ImageConstant.imgDentist,"Dentist",ColorConstant.gray5002),
      SpecialistCategory(ImageConstant.imgOptometry,"Optometry",ColorConstant.lightBlue),
      SpecialistCategory(ImageConstant.imgGeneral,"General",ColorConstant.blue5001),
      SpecialistCategory(ImageConstant.imgCardiology,"Cardiology",ColorConstant.red50),
      SpecialistCategory(ImageConstant.imgNephrology,"Nephrology",ColorConstant.deepPurple5001),
      SpecialistCategory(ImageConstant.imgPulmonology,"Pulmonology",ColorConstant.red50),
      SpecialistCategory(ImageConstant.imgMedicine,"Medicine",ColorConstant.lightPurple),
      SpecialistCategory(ImageConstant.imgOrthopedic2nd,"Orthopadic",ColorConstant.lightOrange),
      SpecialistCategory(ImageConstant.imgHematology,"Hematology",ColorConstant.purple50),
    ];
  }

  static List<PopularDoctor> getPopularDoctor(){
    return [
    PopularDoctor(ImageConstant.imgPopulerDoctor1st,"Dr. Ronald richards","Orthopedic","5.0"),
    PopularDoctor(ImageConstant.imgPopulerDoctor2nd,"Dr. Jenny wilson","Nephrology","5.0"),
    PopularDoctor(ImageConstant.imgPopulerDoctor3rd,"Dr. Jenny Wilson","Sr Orthopedic","5.0"),
    PopularDoctor(ImageConstant.imgPopulerDoctor4th,"Dr. Esther Howard","Jn Orthopedic","4.9"),
    PopularDoctor(ImageConstant.imgPopulerDoctor5th,"Dr. Cameron Williamson","Optometry","4.8"),
    PopularDoctor(ImageConstant.imgPopulerDoctor6th,"Dr. Leslie Alexander","Dentist","4.6"),
    PopularDoctor(ImageConstant.imgPopulerDoctor7th,"Dr. Robert Fox","Neurologist","4.5"),
    PopularDoctor(ImageConstant.imgPopulerDoctor8th,"Dr. Darrell Steward","Optometry","5.0"),
    ];
  }

  static List<AvailableDoctor> getAvailableDoctor(){
    return [
      AvailableDoctor(ImageConstant.imgAvailableDoctor1st,"Dr. Jenny Wilson","Nurologist","5+ year expirence","16 jan | 10:00 am - 06:00 pm"),
      AvailableDoctor(ImageConstant.imgAvailableDoctor2nd,"Dr. Robert fox","Dentist","5+ year expirence","Available for your need"),
      AvailableDoctor(ImageConstant.imgAvailableDoctor3rd,"Dr. Jenny wilson","Cardiology","5+ year expirence","16 jan | 10:00 am - 06:00 pm"),
      AvailableDoctor(ImageConstant.imgAvailableDoctor4th,"Dr. Esther Howard","Orthopedic ,London - England","5+ year expirence","Available for your need"),
      AvailableDoctor(ImageConstant.imgAvailableDoctor5th,"Dr. Aileen fullbright","Optometric","5+ year expirence","Available for your need"),
    ];
  }


}
