import 'package:doctorapp/health/home_sceens/body_fat_screen.dart';
import 'package:doctorapp/health/home_sceens/body_mass_index.dart';
import 'package:doctorapp/health/home_sceens/health_home_page.dart';
import 'package:doctorapp/health/home_sceens/ideal_weight_screen.dart';
import 'package:doctorapp/health/page/BodyFatPage.dart';
import 'package:doctorapp/presentation/splash_two_screen/splash_two_screen.dart';
import 'package:doctorapp/presentation/splash_two_screen/binding/splash_two_binding.dart';
import 'package:doctorapp/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:doctorapp/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:doctorapp/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:doctorapp/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:doctorapp/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:doctorapp/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:doctorapp/presentation/switch_contory_code_screen/switch_contory_code_screen.dart';
import 'package:doctorapp/presentation/switch_contory_code_screen/binding/switch_contory_code_binding.dart';
import 'package:doctorapp/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:doctorapp/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:doctorapp/presentation/verification_screen/verification_screen.dart';
import 'package:doctorapp/presentation/verification_screen/binding/verification_binding.dart';
import 'package:doctorapp/presentation/reset_passsword_screen/reset_passsword_screen.dart';
import 'package:doctorapp/presentation/reset_passsword_screen/binding/reset_passsword_binding.dart';
import 'package:doctorapp/presentation/reset_passsword_success_screen/reset_passsword_success_screen.dart';
import 'package:doctorapp/presentation/reset_passsword_success_screen/binding/reset_passsword_success_binding.dart';
import 'package:doctorapp/presentation/filter_screen/filter_screen.dart';
import 'package:doctorapp/presentation/filter_screen/binding/filter_binding.dart';
import 'package:doctorapp/presentation/doctor_details_screen/doctor_details_screen.dart';
import 'package:doctorapp/presentation/doctor_details_screen/binding/doctor_details_binding.dart';
import 'package:doctorapp/presentation/book_appointment_screen/book_appointment_screen.dart';
import 'package:doctorapp/presentation/book_appointment_screen/binding/book_appointment_binding.dart';
import 'package:doctorapp/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:doctorapp/presentation/payment_method_screen/binding/payment_method_binding.dart';
import 'package:doctorapp/presentation/payment_method1_screen/payment_method1_screen.dart';
import 'package:doctorapp/presentation/payment_method1_screen/binding/payment_method1_binding.dart';
import 'package:doctorapp/presentation/home_page_screen/home_page_screen.dart';
import 'package:doctorapp/presentation/home_page_screen/binding/home_page_binding.dart';
import 'package:doctorapp/presentation/specialist_screen/specialist_screen.dart';
import 'package:doctorapp/presentation/specialist_screen/binding/specialist_binding.dart';
import 'package:doctorapp/presentation/popular_doctors_screen/popular_doctors_screen.dart';
import 'package:doctorapp/presentation/popular_doctors_screen/binding/popular_doctors_binding.dart';
import 'package:doctorapp/presentation/avaliable_doctors_screen/avaliable_doctors_screen.dart';
import 'package:doctorapp/presentation/avaliable_doctors_screen/binding/avaliable_doctors_binding.dart';
import 'package:doctorapp/presentation/orthopedic_screen/orthopedic_screen.dart';
import 'package:doctorapp/presentation/orthopedic_screen/binding/orthopedic_binding.dart';
import 'package:doctorapp/presentation/nephrology_screen/nephrology_screen.dart';
import 'package:doctorapp/presentation/nephrology_screen/binding/nephrology_binding.dart';
import 'package:doctorapp/presentation/pulmonology_screen/pulmonology_screen.dart';
import 'package:doctorapp/presentation/pulmonology_screen/binding/pulmonology_binding.dart';
import 'package:doctorapp/presentation/bokking_success_screen/bokking_success_screen.dart';
import 'package:doctorapp/presentation/bokking_success_screen/binding/bokking_success_binding.dart';
import 'package:doctorapp/presentation/neurologist_screen/neurologist_screen.dart';
import 'package:doctorapp/presentation/neurologist_screen/binding/neurologist_binding.dart';
import 'package:doctorapp/presentation/my_appoiments_screen/my_appoiments_screen.dart';
import 'package:doctorapp/presentation/my_appoiments_screen/binding/my_appoiments_binding.dart';
import 'package:doctorapp/presentation/appoiments_details_screen/appoiments_details_screen.dart';
import 'package:doctorapp/presentation/appoiments_details_screen/binding/appoiments_details_binding.dart';
import 'package:doctorapp/presentation/chat_screen/chat_screen.dart';
import 'package:doctorapp/presentation/chat_screen/binding/chat_binding.dart';
import 'package:doctorapp/presentation/chat1_screen/chat1_screen.dart';
import 'package:doctorapp/presentation/chat1_screen/binding/chat1_binding.dart';
import 'package:doctorapp/presentation/call_meeting_screen/call_meeting_screen.dart';
import 'package:doctorapp/presentation/call_meeting_screen/binding/call_meeting_binding.dart';
import 'package:doctorapp/presentation/video_call_screen/video_call_screen.dart';
import 'package:doctorapp/presentation/video_call_screen/binding/video_call_binding.dart';
import 'package:doctorapp/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:doctorapp/presentation/chat_details_screen/binding/chat_details_binding.dart';
import 'package:doctorapp/presentation/profille_screen/profille_screen.dart';
import 'package:doctorapp/presentation/profille_screen/binding/profille_binding.dart';
import 'package:doctorapp/presentation/profile_details_screen/profile_details_screen.dart';
import 'package:doctorapp/presentation/profile_details_screen/binding/profile_details_binding.dart';
import 'package:doctorapp/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:doctorapp/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:doctorapp/presentation/add_a_card_one_screen/add_a_card_one_screen.dart';
import 'package:doctorapp/presentation/add_a_card_one_screen/binding/add_a_card_one_binding.dart';
import 'package:doctorapp/presentation/add_a_card_screen/add_a_card_screen.dart';
import 'package:doctorapp/presentation/add_a_card_screen/binding/add_a_card_binding.dart';
import 'package:doctorapp/presentation/my_cards_screen/my_cards_screen.dart';
import 'package:doctorapp/presentation/my_cards_screen/binding/my_cards_binding.dart';
import 'package:doctorapp/presentation/notifications_screen/notifications_screen.dart';
import 'package:doctorapp/presentation/notifications_screen/binding/notifications_binding.dart';
import 'package:doctorapp/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:doctorapp/presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
import 'package:doctorapp/presentation/log_out_screen/log_out_screen.dart';
import 'package:doctorapp/presentation/log_out_screen/binding/log_out_binding.dart';
import 'package:doctorapp/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:doctorapp/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../health/home_sceens/blood_alcohol_acreen.dart';
import '../health/home_sceens/blood_donation_screen.dart';
import '../health/home_sceens/blood_volume_screen.dart';
import '../health/home_sceens/breath_count_screen.dart';
import '../health/home_sceens/calorias_for_screen.dart';
import '../health/home_sceens/ovulation_period_screen.dart';
import '../health/home_sceens/pregnancy_duration_screen.dart';
import '../health/home_sceens/target_heart_screen.dart';
import '../health/home_sceens/water_intake_screen.dart';
import '../health/model/RowItem.dart';
import '../health/page/BloodPressurePage.dart';
import '../presentation/home_screen_container_screen/binding/home_screen_container_binding.dart';
import '../presentation/home_screen_container_screen/home_screen_container_screen.dart';

class AppRoutes {
  static const String splashTwoScreen = '/splash_two_screen';

  static const String gridScreen = '/grid_screen';

  static const String splashScreen = '/splash_screen';

  static const String splashOneScreen = '/splash_one_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String logInWithErrorScreen = '/log_in_with_error_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String switchContoryCodeScreen = '/switch_contory_code_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String verificationWithErrorScreen =
      '/verification_with_error_screen';

  static const String resetPassswordScreen = '/reset_passsword_screen';

  static const String resetPassswordSuccessScreen =
      '/reset_passsword_success_screen';

  static const String filterScreen = '/filter_screen';

  static const String doctorDetailsScreen = '/doctor_details_screen';

  static const String bookAppointmentScreen = '/book_appointment_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String paymentMethod1Screen = '/payment_method1_screen';

  static const String homePageScreen = '/home_page_screen';
  static const String homePAgeContainer = '/home_screen_container_screen';

  static const String specialistScreen = '/specialist_screen';

  static const String popularDoctorsScreen = '/popular_doctors_screen';

  static const String avaliableDoctorsScreen = '/avaliable_doctors_screen';

  static const String orthopedicScreen = '/orthopedic_screen';

  static const String nephrologyScreen = '/nephrology_screen';

  static const String pulmonologyScreen = '/pulmonology_screen';

  static const String bokkingSuccessScreen = '/bokking_success_screen';

  static const String neurologistScreen = '/neurologist_screen';

  static const String emptyAppointmentScreen = '/empty_appointment_screen';

  static const String myAppoimentsScreen = '/my_appoiments_screen';

  static const String appoimentsDetailsScreen = '/appoiments_details_screen';

  static const String emptyChatScreen = '/empty_chat_screen';

  static const String chatScreen = '/chat_screen';

  static const String chat1Screen = '/chat1_screen';

  static const String callMeetingScreen = '/call_meeting_screen';

  static const String videoCallScreen = '/video_call_screen';

  static const String chatDetailsScreen = '/chat_details_screen';

  static const String profilleScreen = '/profille_screen';

  static const String profileDetailsScreen = '/profile_details_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String addACardOneScreen = '/add_a_card_one_screen';

  static const String addACardScreen = '/add_a_card_screen';

  static const String myCardsScreen = '/my_cards_screen';

  static const String emptyNotificationsScreen = '/empty_notifications_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String logOutScreen = '/log_out_screen';

  static const String emptyMyCardsScreen = '/empty_my_cards_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';


  // health Route

  static const String idealWeightPage = '/IdealWeightPage';
  static const String bodyMassPage = '/BodyMassPage';
  static const String bodyFatPage = '/BodyFatPage';
  static const String caloriesWeightPage = '/CaloriesWeightPage';
  static const String waterIntakePage = '/WaterIntakePage';
  static const String heartRatePage = '/HeartRatePage';
  static const String pregnancyPage = '/PregnancyPage';
  static const String ovulationPage = '/OvulationPage';
  static const String bloodVolumePage = '/BloodVolumePage';
  static const String bloodDonationPage = '/BloodDonationPage';
  static const String bloodAlcoholPage = '/BloodAlcoholPage';
  static const String breathCountPage = '/BreathCountPage';
  static const String bloodPressurePage = '/BloodPressurePage';
  static const String healthHomePage = '/HealthHomePage';

  static List<GetPage> pages = [
    GetPage(
      name: splashTwoScreen,
      page: () => SplashTwoScreen(),
      bindings: [
        SplashTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: healthHomePage,
      page: () => HealthHomePageScreen(),

    ),
    GetPage(
      name: switchContoryCodeScreen,
      page: () => SwitchContoryCodeScreen(),
      bindings: [
        SwitchContoryCodeBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verificationScreen,
      page: () => VerificationScreen(),
      bindings: [
        VerificationBinding(),
      ],
    ),

    GetPage(
      name: resetPassswordScreen,
      page: () => ResetPassswordScreen(),
      bindings: [
        ResetPassswordBinding(),
      ],
    ),
    GetPage(
      name: resetPassswordSuccessScreen,
      page: () => ResetPassswordSuccessScreen(),
      bindings: [
        ResetPassswordSuccessBinding(),
      ],
    ),
    GetPage(
      name: filterScreen,
      page: () => FilterScreen(),
      bindings: [
        FilterBinding(),
      ],
    ),
    GetPage(
      name: doctorDetailsScreen,
      page: () => DoctorDetailsScreen(),
      bindings: [
        DoctorDetailsBinding(),
      ],
    ),
    GetPage(
      name: bookAppointmentScreen,
      page: () => BookAppointmentScreen(),
      bindings: [
        BookAppointmentBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: paymentMethod1Screen,
      page: () => PaymentMethod1Screen(),
      bindings: [
        PaymentMethod1Binding(),
      ],
    ),
    GetPage(
      name: homePageScreen,
      page: () => HomePageScreen(),
      bindings: [
        HomePageBinding(),
      ],
    ),

    GetPage(
      name: homePAgeContainer,
      page: () => HomeScreenContainerScreen(),
      bindings: [
        HomeScreenContainerBinding(),
      ],
    ),
    GetPage(
      name: specialistScreen,
      page: () => SpecialistScreen(),
      bindings: [
        SpecialistBinding(),
      ],
    ),
    GetPage(
      name: popularDoctorsScreen,
      page: () => PopularDoctorsScreen(),
      bindings: [
        PopularDoctorsBinding(),
      ],
    ),
    GetPage(
      name: avaliableDoctorsScreen,
      page: () => AvaliableDoctorsScreen(),
      bindings: [
        AvaliableDoctorsBinding(),
      ],
    ),
    GetPage(
      name: orthopedicScreen,
      page: () => OrthopedicScreen(),
      bindings: [
        OrthopedicBinding(),
      ],
    ),
    GetPage(
      name: nephrologyScreen,
      page: () => NephrologyScreen(),
      bindings: [
        NephrologyBinding(),
      ],
    ),
    GetPage(
      name: pulmonologyScreen,
      page: () => PulmonologyScreen(),
      bindings: [
        PulmonologyBinding(),
      ],
    ),
    GetPage(
      name: bokkingSuccessScreen,
      page: () => BokkingSuccessScreen(),
      bindings: [
        BokkingSuccessBinding(),
      ],
    ),
    GetPage(
      name: neurologistScreen,
      page: () => NeurologistScreen(),
      bindings: [
        NeurologistBinding(),
      ],
    ),
    GetPage(
      name: myAppoimentsScreen,
      page: () => MyAppoimentsScreen(),
      bindings: [
        MyAppoimentsBinding(),
      ],
    ),
    GetPage(
      name: appoimentsDetailsScreen,
      page: () => AppoimentsDetailsScreen(),
      bindings: [
        AppoimentsDetailsBinding(),
      ],
    ),
    GetPage(
      name: chatScreen,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding(),
      ],
    ),
    GetPage(
      name: chat1Screen,
      page: () => Chat1Screen(),
      bindings: [
        Chat1Binding(),
      ],
    ),
    GetPage(
      name: callMeetingScreen,
      page: () => CallMeetingScreen(),
      bindings: [
        CallMeetingBinding(),
      ],
    ),
    GetPage(
      name: videoCallScreen,
      page: () => VideoCallScreen(),
      bindings: [
        VideoCallBinding(),
      ],
    ),
    GetPage(
      name: chatDetailsScreen,
      page: () => ChatDetailsScreen(),
      bindings: [
        ChatDetailsBinding(),
      ],
    ),
    GetPage(
      name: profilleScreen,
      page: () => ProfilleScreen(),
      bindings: [
        ProfilleBinding(),
      ],
    ),
    GetPage(
      name: profileDetailsScreen,
      page: () => ProfileDetailsScreen(),
      bindings: [
        ProfileDetailsBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: addACardOneScreen,
      page: () => AddACardOneScreen(),
      bindings: [
        AddACardOneBinding(),
      ],
    ),
    GetPage(
      name: addACardScreen,
      page: () => AddACardScreen(),
      bindings: [
        AddACardBinding(),
      ],
    ),
    GetPage(
      name: myCardsScreen,
      page: () => MyCardsScreen(),
      bindings: [
        MyCardsBinding(),
      ],
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      bindings: [
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      bindings: [
        PrivacyPolicyBinding(),
      ],
    ),
    GetPage(
      name: logOutScreen,
      page: () => LogOutScreen(),
      bindings: [
        LogOutBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashTwoScreen(),
      bindings: [
        SplashTwoBinding(),
      ],
    ),

    // health pages

    GetPage(
      name: idealWeightPage,
      page: () => IdealWeightScreen(),
    ),

    GetPage(
      name: bodyMassPage,
      page: () => BodyMassIndexScreen(),
    ),

    GetPage(
      name: bodyFatPage,
      page: () => BOdyFatScreen(),
    ),

    GetPage(
      name: caloriesWeightPage,
      page: () => CaloriasForScreen(),
    ),

    GetPage(
      name: waterIntakePage,
      page: () => WaterIntakeScreen(),
    ),

    GetPage(
      name: heartRatePage,
      page: () => TargetHeartScreen(),
    ),

    GetPage(
      name: pregnancyPage,
      page: () => PregnancyDurationScreen(),
    ),
    GetPage(
      name: ovulationPage,
      page: () => OvulationPeriodScreen(),
    ),


    GetPage(
      name: bloodVolumePage,
      page: () => BloodVolumeScreen(),
    ),



    GetPage(
      name: bloodDonationPage,
      page: () => BloodDonationScreen(),
    ),


    GetPage(
      name: bloodAlcoholPage,
      page: () => BloodAlcoholScreen(),
    ),

    GetPage(
      name: breathCountPage,

      page: () => BreathCountScreen(),
    ),
    GetPage(
      name:bloodPressurePage,

      page: () => BloodPressurePage(),
    ),


  ];

 static  fromKey(var name, RowItem rowItem) {
    switch (name) {
      case idealWeightPage:
        return (IdealWeightScreen(
          rowItem: rowItem,
        ));



      case bodyMassPage:
        return BodyMassIndexScreen(
          rowItem: rowItem,
        );


      case bodyFatPage:
        return  BOdyFatScreen(
          rowItem: rowItem,
        );

      case caloriesWeightPage:
        return CaloriasForScreen(
          rowItem: rowItem,
        );

      case waterIntakePage:
        return WaterIntakeScreen( rowItem: rowItem,);

      case heartRatePage:
        return (TargetHeartScreen( rowItem: rowItem,));

      case pregnancyPage:
        return (PregnancyDurationScreen( rowItem: rowItem,));

      case ovulationPage:
        return (OvulationPeriodScreen( rowItem: rowItem,));

      case bloodVolumePage:
        return (BloodVolumeScreen( rowItem: rowItem,));

      case bloodDonationPage:
        return (BloodDonationScreen( rowItem: rowItem,));

      case bloodAlcoholPage:
        return (BloodAlcoholScreen( rowItem: rowItem,));

      case breathCountPage:
        return (BreathCountScreen( rowItem: rowItem,));

      case bloodPressurePage:
        return (BloodPressurePage( rowItem: rowItem,));

      default:
        return null;
    }
  }

}




