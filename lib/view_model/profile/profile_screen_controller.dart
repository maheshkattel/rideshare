import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/repository/profile_screen_repo.dart';

class ProfileScreenController extends GetxController {
  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  final profile = ProfileScreenRepository();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString gender = ''.obs;
  RxString address = ''.obs;
  RxString image = ''.obs;
  getUserDetails() {
    profile.getUserDetails().then((value) {
      if (value!.id.isEmpty) {
        if (kDebugMode) {
          print('--error getting user details--');
        }
      } else {
        name.value = value['name'];
        email.value = value['email'];
        phone.value = value['phone'];
        gender.value = value['gender'];
        address.value = value['district'];
        image.value = value['image'];
        update();
      }
    });
  }
}
