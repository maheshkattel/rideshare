import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridesharingapp/utils/utils.dart';

class LoginScreenRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> login(email, password) async {
    UserCredential? credential;
    try {
      if (email.isEmpty && password.isEmpty) {
        Utils.snackBar('Error', 'Please fill all the fields');
      } else {
        credential = await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .timeout(const Duration(seconds: 15));
      }
    } on SocketException {
      throw const SocketException('Internet Error');
    } on TimeoutException {
      throw TimeoutException('Request Timed Out');
    }
    return credential;
  }
}
