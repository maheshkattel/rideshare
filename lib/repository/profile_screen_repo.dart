import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileScreenRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _docId = FirebaseAuth.instance.currentUser!.uid;

  Future<DocumentSnapshot?> getUserDetails() async {
    DocumentSnapshot? reference;
    try {
      reference = await _firestore.collection('users').doc(_docId).get();
    } catch (e) {
      if (kDebugMode) {
        print('--error while getting user details $e --');
      }
    }
    return reference;
  }
}
