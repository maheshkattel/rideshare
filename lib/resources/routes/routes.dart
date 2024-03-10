import 'package:get/get.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import 'package:ridesharingapp/view/about_us/about_us.dart';
import 'package:ridesharingapp/view/car_screen/available_car-screen.dart';
import 'package:ridesharingapp/view/car_screen/available_car_list.dart';
import 'package:ridesharingapp/view/car_screen/car_details_page.dart';
import 'package:ridesharingapp/view/car_screen/request_rent.dart';
import 'package:ridesharingapp/view/car_screen/thank_you.dart';
import 'package:ridesharingapp/view/complain_screen/complain_screen.dart';
import 'package:ridesharingapp/view/complete_profile/complete_profile.dart';
import 'package:ridesharingapp/view/first_screen/first_screen.dart';
import 'package:ridesharingapp/view/help_and_support/help_and_support.dart';
import 'package:ridesharingapp/view/history/history.dart';
import 'package:ridesharingapp/view/home_screen/main_screen.dart';
import 'package:ridesharingapp/view/location_screen/location_screen.dart';
import 'package:ridesharingapp/view/login_screen/login_screen.dart';
import 'package:ridesharingapp/view/notification_screen/notification_screen.dart';
import 'package:ridesharingapp/view/offer_screen/offer_screen.dart';
import 'package:ridesharingapp/view/select_transport/select_transport_screen.dart';
import 'package:ridesharingapp/view/settings/change_language.dart';
import 'package:ridesharingapp/view/settings/change_password.dart';
import 'package:ridesharingapp/view/settings/contact_us.dart';
import 'package:ridesharingapp/view/settings/delete_account.dart';
import 'package:ridesharingapp/view/settings/privacy_policy.dart';
import 'package:ridesharingapp/view/user_navigation/user_navigation.dart';
import '../../view/referral_screen/referral_screen.dart';
import '../../view/registration_screen/registration_screen.dart';
import '../../view/settings/settings_screen.dart';
import '../../view/side_drawer/side_drawer.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RoutesName.firstScreen, page: () => FirstScreen()),
        GetPage(name: RoutesName.loginScreen, page: () => LoginScreen()),
        GetPage(
            name: RoutesName.userNavigation,
            page: () => const UserNavigation()),
        GetPage(
            name: RoutesName.registrationScreen,
            page: () => RegistrationScreen()),
        GetPage(
            name: RoutesName.completeProfileScreen,
            page: () => CompleteProfileScreen()),
        GetPage(
            name: RoutesName.homeScreenTransport,
            page: () => const MainScreen()),
        GetPage(
            name: RoutesName.notificationScreen,
            page: () => const NotificationScreen()),
        GetPage(
            name: RoutesName.locationScreen,
            page: () => const LocationScreen()),
        GetPage(
            name: RoutesName.selectTransportScreen,
            page: () => const SelectTransportScreen()),
        GetPage(
            name: RoutesName.availableCarScreen,
            page: () => const AvailableCarScreen()),
        GetPage(
            name: RoutesName.availableCarList,
            page: () => const AvailableCarList()),
        GetPage(
            name: RoutesName.carDetailsScreen,
            page: () => const CarDetailsPage()),
        GetPage(
            name: RoutesName.carRequestRentScreen,
            page: () => const RequestRent()),
        GetPage(name: RoutesName.thankYouScreen, page: () => const ThankYou()),
        GetPage(name: RoutesName.offerScreen, page: () => const OfferScreen()),
        GetPage(name: RoutesName.sideDrawer, page: () => SideDrawer()),
        GetPage(name: RoutesName.historyScreen, page: () => HistoryPage()),
        GetPage(
            name: RoutesName.complainScreen,
            page: () => const ComplainScreen()),
        GetPage(
            name: RoutesName.referralScreen,
            page: () => const ReferralScreen()),
        GetPage(name: RoutesName.aboutUSScreen, page: () => const AboutUs()),
        GetPage(
            name: RoutesName.settingsScreen, page: () => const SettingsPage()),
        GetPage(
            name: RoutesName.changePasswordScreen,
            page: () => const ChangePassword()),
        GetPage(
            name: RoutesName.privacyPolicyScreen,
            page: () => const PrivacyPolicy()),
        GetPage(
            name: RoutesName.contactUsScreen, page: () => const ContactUs()),
        GetPage(
            name: RoutesName.deleteAccount, page: () => const DeleteAccount()),
        GetPage(
            name: RoutesName.helpAndSupport,
            page: () => const HelpandSupport()),
        GetPage(
            name: RoutesName.changeLanguage,
            page: () => const ChangeLanguage()),
      ];
}
