import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class CompleteProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveUserDetails(data) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set(data)
          .timeout(const Duration(seconds: 15));
      // return reference;
    } catch (e) {
      if (kDebugMode) {
        print('--error on completing profile while registration+ $e--');
        if (e.toString() == 'no_internet'.tr) {
          Utils.snackBar(
              'Internet Error', 'No-Internet or Weak Internet Connection.');
        }
        if (e.toString() == 'request_timeout'.tr) {
          Utils.snackBar('Request Timeout',
              'Unable to process your request at this time please try again.');
        }
        if (e.toString() == 'request_block'.tr) {
          Utils.snackBar('Request Blocked',
              'We have blocked your request due to many attempts please try again later.');
        }
        if (e.toString() == 'network unavailable, sleeping.') {
          print('Error');
        }
      }
    }
  }
}
