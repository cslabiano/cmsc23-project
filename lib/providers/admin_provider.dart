import 'package:cloud_firestore/cloud_firestore.dart';
import '/api/firebase_admin_api.dart';
import 'package:flutter/material.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();
  late Stream<QuerySnapshot> _aStream;
  late Stream<QuerySnapshot> _dStream;

  Stream<QuerySnapshot> get dStream => _dStream;

  Stream<QuerySnapshot> fetchOrgApproval() {
    _aStream = firebaseService.getAllApproval();
    notifyListeners();
    return _aStream;
  }

  void fetchDonors(String status) {
    _dStream = firebaseService.getAllDonors(status);
    notifyListeners();
  }

  Stream<QuerySnapshot> get aStream => _aStream;
}
