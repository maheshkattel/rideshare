import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/data/app_exceptions.dart';
import 'package:ridesharingapp/utils/utils.dart';

class RegistrationScreenRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// register user
  Future<UserCredential?> registerUser(String email, String password) async {
    UserCredential? credential;
    try {
      if (email.isEmpty || password.isEmpty) {
        Utils.snackBar('Error', 'please fill all the fields');
      } else {
        credential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .timeout(const Duration(seconds: 15));
      }
    } on SocketException {
      throw InternetException('Error');
    } on InternetException {
      throw InternetException('Error');
    }
    return credential;
  }

  //show Terms and Conditions

  showTermsAndConditions(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Terms and Conditions"),
              content: Text('privacy_policy'.tr, textAlign: TextAlign.justify),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Ok'))
              ],
            ));
  }
}
