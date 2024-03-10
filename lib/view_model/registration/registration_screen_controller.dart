import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/utils/utils.dart';
import '../../repository/registration_screen_repo/registration_screen_repo.dart';
import '../../resources/routes/routes_name.dart';

class RegistrationScreenController extends GetxController {
  final _registration = RegistrationScreenRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  RxBool loading = false.obs;
  RxBool terms = false.obs;

  //registerUser
  void registerUser() {
    loading.value = true;
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        terms.isFalse) {
      loading.value = false;
      Utils.snackBar('Warning', 'Please accept Terms and Conditions');
    } else {
      _registration
          .registerUser(emailController.text, passwordController.text)
          .then((value) {
        if (value!.user!.uid.isEmpty) {
          return 'Error please try again';
        } else {
          loading.value = false;
          Get.toNamed(RoutesName.completeProfileScreen);
        }
        if (kDebugMode) {
          print('Login Successful');
        }
      }).onError((error, stackTrace) {
        loading.value = false;
        if (kDebugMode) {
          if (error.toString() == 'email_already_used'.tr) {
            Utils.snackBar('Try Another email',
                'The email is being used by another account. Please use another one.');
          }
          if (error.toString() == 'weak_password'.tr) {
            Utils.snackBar('Use Strong Password',
                'Password should be minimum of 6 characters.');
          }
          if (error.toString() == 'no_internet'.tr) {
            Utils.snackBar('Check Internet Connection',
                'No-Internet / Weak Internet Connection, please try again.');
          }
          if (error.toString() == 'badly_formatted_email'.tr) {
            Utils.snackBar('Error', 'Please enter valid email address.');
          }
          if (error.toString() == 'request_timeout'.tr) {
            Utils.snackBar('Request Timeout',
                'Unable to process your request at this time please try again.');
          }
          print('--error on registration module $error--');
        }
        return null;
      });
    }
  }

  //upgrade Terms and Conditions
  termsAndConditions(bool value) {
    terms.value = value;
    update();
  }

  showTerms(BuildContext context) {
    _registration.showTermsAndConditions(context);
  }
}
