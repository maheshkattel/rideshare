import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import 'package:ridesharingapp/utils/utils.dart';
import '../../repository/login_screen_repo/login_screen_repo.dart';

class LoginScreenController extends GetxController {
  final _login = LoginScreenRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  RxBool loading = false.obs;

  void login() {
    loading.value = true;
    _login.login(emailController.text, passwordController.text).then((value) {
      if (value!.user!.uid.isEmpty) {
        Utils.snackBar('error', 'Please try again');
        loading.value = false;
      } else {
        Get.toNamed(RoutesName.homeScreenTransport);
        loading.value = false;
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      if (kDebugMode) {
        if (error.toString() == 'badly_formatted_email'.tr) {
          Utils.snackBar('Email Error', 'Email address is not valid.');
        }
        if (error.toString() == 'invalid_credentials'.tr) {
          Utils.snackBar(
              'Invalid Credentials', 'Email or password is not valid.');
        }
        if (error.toString() == 'no_internet'.tr) {
          Utils.snackBar(
              'Internet Error', 'No-Internet or Weak Internet Connection.');
        }
        if (error.toString() == 'request_timeout'.tr) {
          Utils.snackBar('Request Timeout',
              'Unable to process your request at this time please try again.');
        }
        if (error.toString() == 'request_block'.tr) {
          Utils.snackBar('Request Blocked',
              'We have blocked your request due to many attempts please try again later.');
        }
        print('--error on login module $error --');
      }
      return null;
    });
  }
}
